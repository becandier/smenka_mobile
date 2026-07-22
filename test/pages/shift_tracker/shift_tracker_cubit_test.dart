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
import 'package:smenka_mobile/data/api/local/work_schedule_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

class _MockWorkScheduleRepository extends Mock
    implements WorkScheduleRepository {}

class _MockGeoService extends Mock implements GeoService {}

class _MockShiftContextStorage extends Mock implements ShiftContextStorage {}

class _MockWorkScheduleContextStorage extends Mock
    implements WorkScheduleContextStorage {}

class _MockConnectivity extends Mock implements Connectivity {}

const _emptySchedules = MySchedules(
  items: [],
  total: 0,
  requireSchedule: false,
);

WorkSchedule _schedule(String id, {String name = 'Дневная'}) => WorkSchedule(
  id: id,
  name: name,
  startTime: '09:00',
  endTime: '18:00',
  durationMinutes: 540,
  crossesMidnight: false,
  nextStartAt: DateTime.utc(2026, 6, 11, 6),
  nextEndAt: DateTime.utc(2026, 6, 11, 15),
  isCurrent: true,
  startsInMinutes: -10,
);

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
  late _MockWorkScheduleRepository scheduleRepo;
  late _MockGeoService geo;
  late _MockShiftContextStorage contextStorage;
  late _MockWorkScheduleContextStorage scheduleContextStorage;
  late _MockConnectivity connectivity;

  setUp(() {
    shiftRepo = _MockShiftRepository();
    orgRepo = _MockOrganizationRepository();
    scheduleRepo = _MockWorkScheduleRepository();
    geo = _MockGeoService();
    contextStorage = _MockShiftContextStorage();
    scheduleContextStorage = _MockWorkScheduleContextStorage();
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

    // По умолчанию у org нет графиков (require_schedule=false) — не мешает
    // тестам, которые не проверяют work_schedules.
    when(
      () => scheduleRepo.getMySchedules(
        any(),
        workLocationId: any(named: 'workLocationId'),
      ),
    ).thenAnswer((_) async => const Task<MySchedules>.success(_emptySchedules));
    when(() => scheduleContextStorage.read(any(), any())).thenReturn(null);
    when(
      () => scheduleContextStorage.save(any(), any(), any()),
    ).thenAnswer((_) async {});
  });

  ShiftTrackerCubit buildCubit() => ShiftTrackerCubit(
    shiftRepository: shiftRepo,
    organizationRepository: orgRepo,
    workScheduleRepository: scheduleRepo,
    geoService: geo,
    contextStorage: contextStorage,
    scheduleContextStorage: scheduleContextStorage,
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
        // Смена точки перезапрашивает графики (work_schedules) — ждём, пока
        // фоновая загрузка расчистится, иначе canStartShift временно false
        // из-за schedulesLoading (ожидаемое поведение, см. ТЗ «loading»).
        await pumpEventQueue();
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

  group('гео-отказы при старте → StartShiftResult (org с geoCheckEnabled)', () {
    final orgGeoOn = Organization(
      id: 'orgGeo',
      name: 'Geo Org',
      ownerId: 'owner1',
      inviteCode: 'INVGEO01',
      isDeleted: false,
      createdAt: DateTime.utc(2026),
      geoCheckEnabled: true,
    );

    setUp(() {
      when(() => contextStorage.save(any())).thenAnswer((_) async {});
    });

    // Кубит с единственной гео-org, уже выбранной как контекст старта.
    Future<ShiftTrackerCubit> buildWithGeoOrgSelected() async {
      when(
        () => orgRepo.watchMyOrganizations(),
      ).thenAnswer((_) => Stream<List<Organization>>.value([orgGeoOn]));
      final cubit = buildCubit();
      await pumpEventQueue();
      cubit.selectOrganization('orgGeo');
      return cubit;
    }

    // Матрица «GeoFailure → ожидаемый StartShiftResult».
    final cases = <(GeoResult, StartShiftResult)>[
      (const GeoServiceDisabled(), StartShiftResult.geoServiceDisabled),
      (const GeoPermissionDenied(), StartShiftResult.geoPermissionDenied),
      (
        const GeoPermissionDeniedForever(),
        StartShiftResult.geoPermissionDeniedForever,
      ),
      (const GeoUnavailable(), StartShiftResult.geoUnavailable),
      (const GeoInsecureContext(), StartShiftResult.geoInsecureContext),
      (const GeoUnsupported(), StartShiftResult.geoUnsupported),
    ];

    for (final (geoResult, expected) in cases) {
      test('${geoResult.runtimeType} → $expected', () async {
        when(() => geo.getCurrentPosition()).thenAnswer((_) async => geoResult);

        final cubit = await buildWithGeoOrgSelected();
        final result = await cubit.startShift();

        expect(result, expected);
        // Гео-отказ обрывает старт до сети и не помечает action-ошибку
        // (иначе BlocListener сетевых ошибок показал бы ложный тост).
        expect(cubit.state.actionStatus, FeatureStatus.initial);
        verifyNever(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        );
        await cubit.close();
      });
    }

    test('GeoSuccess → координаты уходят в старт, результат success', () async {
      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async => const GeoSuccess(
          latitude: 55.75,
          longitude: 37.61,
          lowAccuracy: false,
        ),
      );
      stubStartShift(Task<Shift>.success(_activeShift()));

      final cubit = await buildWithGeoOrgSelected();
      final result = await cubit.startShift();

      expect(result, StartShiftResult.success);
      verify(
        () => shiftRepo.startShift(
          organizationId: 'orgGeo',
          latitude: 55.75,
          longitude: 37.61,
        ),
      ).called(1);
      await cubit.close();
    });

    test('GeoSuccess c низкой точностью → предупреждение', () async {
      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async => const GeoSuccess(
          latitude: 55.75,
          longitude: 37.61,
          lowAccuracy: true,
        ),
      );
      stubStartShift(Task<Shift>.success(_activeShift()));

      final cubit = await buildWithGeoOrgSelected();
      await cubit.startShift();

      expect(cubit.state.showLowAccuracyWarning, isTrue);
      await cubit.close();
    });
  });

  group('выбор графика при старте (work_schedules)', () {
    final org = Organization(
      id: 'org1',
      name: 'Org 1',
      ownerId: 'owner1',
      inviteCode: 'INV12345',
      isDeleted: false,
      createdAt: DateTime.utc(2026),
      geoCheckEnabled: true,
    );

    setUp(() {
      // Org с геопроверкой — рабочую точку определяет сервер, поэтому
      // startShift() в этой группе всегда проходит через геолокацию.
      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async => const GeoSuccess(
          latitude: 55.75,
          longitude: 37.61,
          lowAccuracy: false,
        ),
      );
    });

    ShiftTrackerCubit buildWithOrgSelected() {
      when(
        () => orgRepo.watchMyOrganizations(),
      ).thenAnswer((_) => Stream<List<Organization>>.value([org]));
      // Единственная организация — предвыбирается автоматически
      // (shift_quick_start), что и запускает загрузку графиков.
      return buildCubit();
    }

    test(
      '0 графиков, require_schedule=false → старт не заблокирован',
      () async {
        when(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => const Task<MySchedules>.success(_emptySchedules),
        );

        final cubit = buildWithOrgSelected();
        await pumpEventQueue();

        expect(cubit.state.availableSchedules, isEmpty);
        expect(cubit.state.scheduleBlockedNoOptions, isFalse);
        expect(cubit.state.canStartShift, isTrue);
        await cubit.close();
      },
    );

    test('0 графиков, require_schedule=true → старт заблокирован', () async {
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer(
        (_) async => const Task<MySchedules>.success(
          MySchedules(items: [], total: 0, requireSchedule: true),
        ),
      );

      final cubit = buildWithOrgSelected();
      await pumpEventQueue();

      expect(cubit.state.scheduleBlockedNoOptions, isTrue);
      expect(cubit.state.canStartShift, isFalse);
      await cubit.close();
    });

    test(
      '1 график → подставляется автоматически, старт доступен сразу',
      () async {
        final schedule = _schedule('s1');
        when(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(
            MySchedules(items: [schedule], total: 1, requireSchedule: false),
          ),
        );

        final cubit = buildWithOrgSelected();
        await pumpEventQueue();

        expect(cubit.state.selectedWorkScheduleId, 's1');
        expect(cubit.state.canStartShift, isTrue);
        await cubit.close();
      },
    );

    test(
      '>1 графика без сохранённого выбора → старт заблокирован до выбора',
      () async {
        final schedules = [_schedule('s1'), _schedule('s2', name: 'Ночная')];
        when(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(
            MySchedules(items: schedules, total: 2, requireSchedule: false),
          ),
        );

        final cubit = buildWithOrgSelected();
        await pumpEventQueue();

        expect(cubit.state.scheduleSelectionRequired, isTrue);
        expect(cubit.state.selectedWorkScheduleId, isNull);
        expect(cubit.state.canStartShift, isFalse);

        cubit.selectWorkSchedule(schedules.first);
        expect(cubit.state.canStartShift, isTrue);
        verify(() => scheduleContextStorage.save('org1', null, 's1')).called(1);
        await cubit.close();
      },
    );

    test(
      '>1 графика с сохранённым выбором → предвыбирается, если ещё доступен',
      () async {
        final schedules = [_schedule('s1'), _schedule('s2', name: 'Ночная')];
        when(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(
            MySchedules(items: schedules, total: 2, requireSchedule: false),
          ),
        );
        when(() => scheduleContextStorage.read('org1', null)).thenReturn('s2');

        final cubit = buildWithOrgSelected();
        await pumpEventQueue();

        expect(cubit.state.selectedWorkScheduleId, 's2');
        expect(cubit.state.canStartShift, isTrue);
        await cubit.close();
      },
    );

    test('startShift отправляет выбранный work_schedule_id', () async {
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(
            items: [_schedule('s1')],
            total: 1,
            requireSchedule: false,
          ),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected();
      await pumpEventQueue();
      expect(cubit.state.selectedWorkScheduleId, 's1');

      await cubit.startShift();

      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workScheduleId: 's1',
        ),
      ).called(1);
      await cubit.close();
    });

    test('SCHEDULE_NOT_AVAILABLE при старте → выбор сброшен, список '
        'перезапрошен', () async {
      // Резолв точки на старте (гео) сужает набор: график, который был
      // единственным до старта, на реальной точке недоступен — после
      // перезапроса сервер отдаёт уже 2 совместимых графика, поэтому старая
      // выборка не подставляется автоматически повторно.
      var call = 0;
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer((_) async {
        call++;
        final items = call == 1
            ? [_schedule('s1')]
            : [_schedule('s2', name: 'Утро'), _schedule('s3', name: 'Ночь')];
        return Task<MySchedules>.success(
          MySchedules(
            items: items,
            total: items.length,
            requireSchedule: false,
          ),
        );
      });
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer(
        (_) async => const Task<Shift>.failure(
          ApiException.server(
            message: 'недоступен',
            code: 'SCHEDULE_NOT_AVAILABLE',
          ),
        ),
      );

      final cubit = buildWithOrgSelected();
      await pumpEventQueue();
      expect(cubit.state.selectedWorkScheduleId, 's1');

      await cubit.startShift();
      await pumpEventQueue();

      expect(cubit.state.selectedWorkScheduleId, isNull);
      verify(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).called(2);
      await cubit.close();
    });

    test('сетевая ошибка загрузки графиков → require_schedule не блокирует '
        'старт (fail-open)', () async {
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer((_) async => const Task<MySchedules>.failure(_networkError));

      final cubit = buildWithOrgSelected();
      await pumpEventQueue();

      expect(cubit.state.schedules.hasData, isFalse);
      expect(cubit.state.scheduleBlockedNoOptions, isFalse);
      expect(cubit.state.canStartShift, isTrue);
      await cubit.close();
    });

    test('персональная смена — графики не запрашиваются вовсе', () async {
      when(
        () => orgRepo.watchMyOrganizations(),
      ).thenAnswer((_) => const Stream<List<Organization>>.empty());

      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.isOrgShift, isFalse);
      expect(cubit.state.canStartShift, isTrue);
      verifyNever(
        () => scheduleRepo.getMySchedules(
          any(),
          workLocationId: any(named: 'workLocationId'),
        ),
      );
      await cubit.close();
    });
  });
}
