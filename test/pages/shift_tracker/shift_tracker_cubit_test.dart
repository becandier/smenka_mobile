import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

class _MockGeoService extends Mock implements GeoService {}

class _MockShiftContextStorage extends Mock implements ShiftContextStorage {}

class _MockConnectivity extends Mock implements Connectivity {}

Task<DefaultPaginator<Shift>> _shiftsPage(List<Shift> shifts) =>
    Task<DefaultPaginator<Shift>>.success(
      DefaultPaginator<Shift>(hasMore: false, data: shifts),
    );

Shift _activeShift() => Shift(
  id: 's1',
  userId: 'u1',
  startedAt: DateTime.utc(2026, 6, 11, 10),
  status: ShiftStatus.active,
  pauses: const [],
  workedSeconds: 0,
);

const _networkError = ApiException.network(
  message: 'no net',
  code: 'NETWORK_ERROR',
);

void main() {
  late _MockShiftRepository shiftRepo;
  late _MockOrganizationRepository orgRepo;
  late _MockGeoService geo;
  late _MockShiftContextStorage contextStorage;
  late _MockConnectivity connectivity;

  setUp(() {
    shiftRepo = _MockShiftRepository();
    orgRepo = _MockOrganizationRepository();
    geo = _MockGeoService();
    contextStorage = _MockShiftContextStorage();
    connectivity = _MockConnectivity();

    when(
      () => orgRepo.watchMyOrganizations(),
    ).thenAnswer((_) => const Stream<List<Organization>>.empty());
    when(() => orgRepo.fetchMyOrganizations()).thenAnswer((_) async {});
    when(() => contextStorage.read()).thenReturn(null);
    when(
      () => connectivity.onConnectivityChanged,
    ).thenAnswer((_) => const Stream<List<ConnectivityResult>>.empty());
    when(
      () => connectivity.checkConnectivity(),
    ).thenAnswer((_) async => [ConnectivityResult.wifi]);

    // По умолчанию активной/приостановленной смены нет.
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
    ).thenAnswer((_) async => _shiftsPage(const []));
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.paused, limit: 1),
    ).thenAnswer((_) async => _shiftsPage(const []));
  });

  ShiftTrackerCubit buildCubit() => ShiftTrackerCubit(
    shiftRepository: shiftRepo,
    organizationRepository: orgRepo,
    geoService: geo,
    contextStorage: contextStorage,
    connectivity: connectivity,
  );

  void stubStartShift(Task<Shift> result) {
    when(
      () => shiftRepo.startShift(
        organizationId: any(named: 'organizationId'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => result);
  }

  // Кубит с уже загруженной активной сменой `s1`.
  Future<ShiftTrackerCubit> buildWithActiveShift(Shift shift) async {
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
    ).thenAnswer((_) async => _shiftsPage([shift]));
    final cubit = buildCubit();
    await pumpEventQueue();
    return cubit;
  }

  group('сетевые ошибки действий', () {
    test(
      'start падает по сети → ошибка + код сети, ретрай не теряет контекст',
      () async {
        stubStartShift(const Task<Shift>.failure(_networkError));

        final cubit = buildCubit();
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.error);
        expect(cubit.state.actionStatus, FeatureStatus.error);
        expect(cubit.state.actionErrorCode, 'NETWORK_ERROR');
        expect(cubit.state.isActionNetworkError, isTrue);

        // retryLastAction повторяет именно start.
        await cubit.retryLastAction();
        verify(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).called(2);
        await cubit.close();
      },
    );

    test('бизнес-ошибка start не помечается как сетевая', () async {
      stubStartShift(
        const Task<Shift>.failure(
          ApiException.server(message: 'busy', code: 'SHIFT_ALREADY_ACTIVE'),
        ),
      );

      final cubit = buildCubit();
      await pumpEventQueue();
      await cubit.startShift();

      expect(cubit.state.actionErrorCode, 'SHIFT_ALREADY_ACTIVE');
      expect(cubit.state.isActionNetworkError, isFalse);
      await cubit.close();
    });

    test(
      'finish падает по сети → активная смена НЕ теряется + ретрай',
      () async {
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer((_) async => _shiftsPage([_activeShift()]));
        when(
          () => shiftRepo.finishShift('s1'),
        ).thenAnswer((_) async => const Task<Shift>.failure(_networkError));

        final cubit = buildCubit();
        await pumpEventQueue();
        // _init загрузил активную смену.
        expect(cubit.state.activeShift.hasData, isTrue);

        await cubit.finishShift();

        expect(cubit.state.actionStatus, FeatureStatus.error);
        expect(cubit.state.actionErrorCode, 'NETWORK_ERROR');
        expect(cubit.state.isActionNetworkError, isTrue);
        // Ключевой инвариант: активная смена остаётся в UI.
        expect(cubit.state.activeShift.hasData, isTrue);

        await cubit.retryLastAction();
        verify(() => shiftRepo.finishShift('s1')).called(2);
        await cubit.close();
      },
    );

    test(
      'pause падает по сети → ошибка + смена не теряется + ретрай',
      () async {
        when(
          () => shiftRepo.pauseShift('s1'),
        ).thenAnswer((_) async => const Task<Shift>.failure(_networkError));
        final cubit = await buildWithActiveShift(_activeShift());

        await cubit.pauseShift();

        expect(cubit.state.actionStatus, FeatureStatus.error);
        expect(cubit.state.isActionNetworkError, isTrue);
        expect(cubit.state.activeShift.hasData, isTrue);

        await cubit.retryLastAction();
        verify(() => shiftRepo.pauseShift('s1')).called(2);
        await cubit.close();
      },
    );

    test(
      'resume падает по сети → ошибка + смена не теряется + ретрай',
      () async {
        when(
          () => shiftRepo.resumeShift('s1'),
        ).thenAnswer((_) async => const Task<Shift>.failure(_networkError));
        final cubit = await buildWithActiveShift(_activeShift());

        await cubit.resumeShift();

        expect(cubit.state.actionStatus, FeatureStatus.error);
        expect(cubit.state.isActionNetworkError, isTrue);
        expect(cubit.state.activeShift.hasData, isTrue);

        await cubit.retryLastAction();
        verify(() => shiftRepo.resumeShift('s1')).called(2);
        await cubit.close();
      },
    );

    test('ретрай после сетевой ошибки приводит к успеху', () async {
      final shift = _activeShift();
      var calls = 0;
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async {
        calls++;
        return calls == 1
            ? const Task<Shift>.failure(_networkError)
            : Task<Shift>.success(shift);
      });

      final cubit = buildCubit();
      await pumpEventQueue();

      await cubit.startShift();
      expect(cubit.state.actionStatus, FeatureStatus.error);

      await cubit.retryLastAction();
      expect(cubit.state.actionStatus, FeatureStatus.success);
      expect(cubit.state.activeShift.hasData, isTrue);
      await cubit.close();
    });
  });

  group('локальный таймер смены', () {
    test(
      'elapsedSeconds считается локально от startedAt (офлайн-инвариант)',
      () async {
        // Смена начата час назад — таймер должен насчитать ~3600 секунд
        // локально, без обращения к сети.
        final startedAt = DateTime.now().toUtc().subtract(
          const Duration(hours: 1),
        );
        final shift = Shift(
          id: 's1',
          userId: 'u1',
          startedAt: startedAt,
          status: ShiftStatus.active,
          pauses: const [],
          workedSeconds: 0,
        );
        final cubit = await buildWithActiveShift(shift);

        expect(cubit.state.elapsedSeconds, greaterThan(3500));
        await cubit.close();
      },
    );
  });

  group('фоновый поллинг авто-завершения', () {
    test(
      'сервер сообщил, что активной/паузной смены нет → авто-финиш + нотис',
      () async {
        final cubit = await buildWithActiveShift(_activeShift());
        expect(cubit.state.hasActiveShift, isTrue);

        // Бэкенд авто-завершил смену: обе выборки теперь пустые.
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.paused, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));

        cubit.onAppResumed();
        await pumpEventQueue();

        expect(cubit.state.hasActiveShift, isFalse);
        expect(cubit.state.shiftAutoFinished, isTrue);
        expect(cubit.state.elapsedSeconds, 0);

        cubit.clearAutoFinishedNotice();
        expect(cubit.state.shiftAutoFinished, isFalse);
        await cubit.close();
      },
    );

    test('смена ещё активна → состояние сохраняется, нотиса нет', () async {
      final cubit = await buildWithActiveShift(_activeShift());

      cubit.onAppResumed();
      await pumpEventQueue();

      expect(cubit.state.hasActiveShift, isTrue);
      expect(cubit.state.shiftAutoFinished, isFalse);
      await cubit.close();
    });

    test(
      'сетевой сбой опроса не роняет показанную смену (нет ложного финиша)',
      () async {
        final cubit = await buildWithActiveShift(_activeShift());

        // Опрос падает по сети — смену НЕЛЬЗЯ считать завершённой.
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer(
          (_) async =>
              const Task<DefaultPaginator<Shift>>.failure(_networkError),
        );

        cubit.onAppResumed();
        await pumpEventQueue();

        expect(cubit.state.hasActiveShift, isTrue);
        expect(cubit.state.shiftAutoFinished, isFalse);
        await cubit.close();
      },
    );
  });

  group('офлайн-индикация (connectivity)', () {
    test('реагирует на смену состояния сети', () async {
      final controller = StreamController<List<ConnectivityResult>>();
      when(
        () => connectivity.onConnectivityChanged,
      ).thenAnswer((_) => controller.stream);

      final cubit = buildCubit();
      await pumpEventQueue();
      expect(cubit.state.isOffline, isFalse);

      controller.add([ConnectivityResult.none]);
      await pumpEventQueue();
      expect(cubit.state.isOffline, isTrue);

      controller.add([ConnectivityResult.wifi]);
      await pumpEventQueue();
      expect(cubit.state.isOffline, isFalse);

      await controller.close();
      await cubit.close();
    });
  });

  group('привязка рабочей точки (shift_work_location)', () {
    final orgGeoOff = Organization(
      id: 'org1',
      name: 'Org 1',
      ownerId: 'owner1',
      inviteCode: 'INV12345',
      isDeleted: false,
      createdAt: DateTime.utc(2026),
      requireWorkLocation: true,
    );
    const point = WorkLocation(id: 'wl1', name: 'Точка А');

    setUp(() {
      when(() => contextStorage.save(any())).thenAnswer((_) async {});
    });

    ShiftTrackerCubit buildWithOrgs(List<Organization> orgs) {
      when(
        () => orgRepo.watchMyOrganizations(),
      ).thenAnswer((_) => Stream<List<Organization>>.value(orgs));
      return buildCubit();
    }

    test(
      'гео выкл + require: кнопка старта заблокирована до выбора точки',
      () async {
        final cubit = buildWithOrgs([orgGeoOff]);
        await pumpEventQueue();
        cubit.selectOrganization('org1');

        expect(cubit.state.showWorkLocationSelector, isTrue);
        expect(cubit.state.requiresWorkLocation, isTrue);
        expect(cubit.state.canStartShift, isFalse);

        cubit.selectWorkLocation(point);
        expect(cubit.state.canStartShift, isTrue);
        await cubit.close();
      },
    );

    test(
      'startShift шлёт work_location_id выбранной точки (без гео)',
      () async {
        when(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

        final cubit = buildWithOrgs([orgGeoOff]);
        await pumpEventQueue();
        cubit
          ..selectOrganization('org1')
          ..selectWorkLocation(point);

        await cubit.startShift();

        verify(
          () => shiftRepo.startShift(
            organizationId: 'org1',
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            workLocationId: 'wl1',
          ),
        ).called(1);
        verifyNever(() => geo.getCurrentPosition());
        await cubit.close();
      },
    );

    test('смена организации сбрасывает выбранную точку', () async {
      final orgB = orgGeoOff.copyWith(id: 'org2', name: 'Org 2');
      final cubit = buildWithOrgs([orgGeoOff, orgB]);
      await pumpEventQueue();
      cubit
        ..selectOrganization('org1')
        ..selectWorkLocation(point);
      expect(cubit.state.selectedWorkLocation, isNotNull);

      cubit.selectOrganization('org2');
      expect(cubit.state.selectedWorkLocation, isNull);
      await cubit.close();
    });
  });
}
