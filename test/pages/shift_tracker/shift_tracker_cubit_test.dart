import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/api/local/work_schedule_context_storage.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
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

class _MockChecklistRepository extends Mock implements ChecklistRepository {}

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

/// Точка отсчёта «сейчас» для всех тестов кубита (см. `buildCubit`,
/// параметр `now`) — фиксированная, а не реальные часы: с введением
/// `schedule_window_enforcement` `canStartShift`/`scheduleSelectionRequired`
/// стали зависеть от `WorkSchedule.nextStartAt`/`nextEndAt` относительно
/// «сейчас», поэтому фикстуры графиков ниже намеренно строятся вокруг этой
/// даты, а не реальных часов запуска тестов.
final _fixedNow = DateTime.utc(2026, 6, 11, 10);

/// Единственная организация сотрудника (`id: 'org1'`) — с гео-проверкой или
/// без, в зависимости от сценария. Общая фикстура для групп «выбор графика»
/// (без/с гео-проверкой) — единственное различие между ними именно в этом
/// флаге.
Organization _org({required bool geoCheckEnabled}) => Organization(
  id: 'org1',
  name: 'Org 1',
  ownerId: 'owner1',
  inviteCode: 'INV12345',
  isDeleted: false,
  createdAt: DateTime.utc(2026),
  geoCheckEnabled: geoCheckEnabled,
);

/// По умолчанию окно графика бракетует [_fixedNow] (уже идёт, стартуем) —
/// подходит для тестов, которым важен только факт наличия графика, а не
/// его окно. Тесты границ окна (`schedule_window_enforcement`) передают
/// [nextStartAt]/[nextEndAt] явно.
WorkSchedule _schedule(
  String id, {
  String name = 'Дневная',
  DateTime? nextStartAt,
  DateTime? nextEndAt,
}) => WorkSchedule(
  id: id,
  name: name,
  startTime: '09:00',
  endTime: '18:00',
  durationMinutes: 540,
  crossesMidnight: false,
  nextStartAt: nextStartAt ?? _fixedNow.subtract(const Duration(hours: 4)),
  nextEndAt: nextEndAt ?? _fixedNow.add(const Duration(hours: 5)),
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
  late _MockChecklistRepository checklistRepo;
  late _MockGeoService geo;
  late _MockShiftContextStorage contextStorage;
  late _MockWorkScheduleContextStorage scheduleContextStorage;
  late _MockConnectivity connectivity;

  setUp(() {
    shiftRepo = _MockShiftRepository();
    orgRepo = _MockOrganizationRepository();
    scheduleRepo = _MockWorkScheduleRepository();
    checklistRepo = _MockChecklistRepository();
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
    // Пост-диагностика уровня блокировки (geo_troubleshooting): кубит дёргает
    // её на ветке GeoPermissionDeniedForever. По умолчанию — «уровень сайта»;
    // тесты уровня переопределяют стаб точечно.
    when(
      () => geo.diagnoseBlockLevel(),
    ).thenAnswer((_) async => GeoBlockLevel.site);

    // По умолчанию активной/приостановленной смены нет.
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
    ).thenAnswer((_) async => _shiftsPage(const []));
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.paused, limit: 1),
    ).thenAnswer((_) async => _shiftsPage(const []));
    // По умолчанию последней завершённой смены нет — блок дозаполнения
    // (checklist_grace_period) не показывается. Тесты фичи переопределяют.
    when(
      () => shiftRepo.getShifts(status: ShiftStatus.finished, limit: 1),
    ).thenAnswer((_) async => _shiftsPage(const []));
    when(
      () => checklistRepo.getShiftChecklists(any()),
    ).thenAnswer((_) async => const Task<List<ChecklistInstance>>.success([]));

    // По умолчанию у org нет графиков (require_schedule=false) — не мешает
    // тестам, которые не проверяют work_schedules. Два формы вызова —
    // отдельные стабы, т.к. это разные сигнатуры (см. WorkScheduleRepository.
    // getMySchedules): `workLocationId` — ранняя загрузка на idle-экране
    // (организации без гео-проверки, точка выбрана вручную); `lat`/`lng` —
    // резолв внутри startShift() (организации с гео-проверкой, точка
    // известна только на старте, см. work_schedules_geo_resolve/mobile.md).
    when(
      () => scheduleRepo.getMySchedules(
        any(),
        workLocationId: any(named: 'workLocationId'),
      ),
    ).thenAnswer((_) async => const Task<MySchedules>.success(_emptySchedules));
    when(
      () => scheduleRepo.getMySchedules(
        any(),
        lat: any(named: 'lat'),
        lng: any(named: 'lng'),
      ),
    ).thenAnswer((_) async => const Task<MySchedules>.success(_emptySchedules));
    when(() => scheduleContextStorage.read(any(), any())).thenReturn(null);
    when(
      () => scheduleContextStorage.save(any(), any(), any()),
    ).thenAnswer((_) async {});

    // По умолчанию — ровно одна подходящая точка (shift_start_location_choice):
    // гео-check тесты, которым сам резолв точки не важен, проходят его молча
    // и попадают в _resolveScheduleForGeoStart с workLocationId: 'wl1'. Тесты
    // самого резолва (0/>1 точек) переопределяют стаб точечно.
    when(
      () => orgRepo.getNearbyWorkLocations(
        any(),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer(
      (_) async => const Task<NearbyWorkLocations>.success(
        NearbyWorkLocations(
          items: [
            NearbyWorkLocation(
              id: 'wl1',
              name: 'Точка',
              distanceMeters: 10,
              isNearest: true,
            ),
          ],
        ),
      ),
    );
  });

  ShiftTrackerCubit buildCubit({DateTime Function()? now}) => ShiftTrackerCubit(
    shiftRepository: shiftRepo,
    organizationRepository: orgRepo,
    workScheduleRepository: scheduleRepo,
    checklistRepository: checklistRepo,
    geoService: geo,
    contextStorage: contextStorage,
    scheduleContextStorage: scheduleContextStorage,
    connectivity: connectivity,
    now: now ?? () => _fixedNow,
  );

  void stubStartShift(Task<Shift> result) {
    when(
      () => shiftRepo.startShift(
        organizationId: any(named: 'organizationId'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
        // Именованные опциональные параметры, отсутствующие в вызове внутри
        // when(), матчатся Dart'ом как литерал `null` (значение по
        // умолчанию), а не как «любое значение» — начиная с
        // shift_start_location_choice геo-check org тоже шлёт непустой
        // workLocationId, поэтому обязательно требуется any(), иначе стаб не
        // совпадёт и mocktail отдаст null вместо Future.
        workLocationId: any(named: 'workLocationId'),
        workScheduleId: any(named: 'workScheduleId'),
      ),
    ).thenAnswer((_) async => result);
  }

  // Единственная организация — предвыбирается автоматически при cold-старте
  // (shift_quick_start, см. ShiftTrackerCubit._maybePreselectContext).
  // Общий хелпер для групп «выбор графика» (без/с гео-проверкой) — они
  // отличаются только флагом geoCheckEnabled в передаваемой организации.
  ShiftTrackerCubit buildWithOrgSelected(
    Organization org, {
    DateTime Function()? now,
  }) {
    when(
      () => orgRepo.watchMyOrganizations(),
    ).thenAnswer((_) => Stream<List<Organization>>.value([org]));
    return buildCubit(now: now);
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
        // Сам объект отказа сохранён — по нему UI строит диалог, а
        // shift_geo_photo_fallback берёт машинный код причины.
        expect(cubit.state.lastGeoFailure, same(geoResult));
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
          // shift_start_location_choice: точка теперь резолвится и клиентом
          // передаётся явно (по умолчанию в тестах — единственная 'wl1' из
          // глобального стаба getNearbyWorkLocations); конкретное значение
          // здесь не важно для теста геоуспеха.
          workLocationId: any(named: 'workLocationId'),
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

    test('GeoPermissionDeniedForever → пост-диагностика уровня блокировки '
        '(geo_troubleshooting)', () async {
      when(
        () => geo.getCurrentPosition(),
      ).thenAnswer((_) async => const GeoPermissionDeniedForever());
      when(
        () => geo.diagnoseBlockLevel(),
      ).thenAnswer((_) async => GeoBlockLevel.system);

      final cubit = await buildWithGeoOrgSelected();
      await cubit.startShift();

      expect(cubit.state.geoBlockLevel, GeoBlockLevel.system);
      verify(() => geo.diagnoseBlockLevel()).called(1);
      await cubit.close();
    });

    test('прочие гео-отказы не дёргают пост-диагностику', () async {
      when(
        () => geo.getCurrentPosition(),
      ).thenAnswer((_) async => const GeoUnavailable());

      final cubit = await buildWithGeoOrgSelected();
      await cubit.startShift();

      expect(cubit.state.geoBlockLevel, GeoBlockLevel.unknown);
      verifyNever(() => geo.diagnoseBlockLevel());
      await cubit.close();
    });

    test('новая попытка старта сбрасывает прошлый гео-отказ', () async {
      when(
        () => geo.getCurrentPosition(),
      ).thenAnswer((_) async => const GeoUnavailable());

      final cubit = await buildWithGeoOrgSelected();
      await cubit.startShift();
      expect(cubit.state.lastGeoFailure, isNotNull);

      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async =>
            const GeoSuccess(latitude: 55, longitude: 37, lowAccuracy: false),
      );
      stubStartShift(Task<Shift>.success(_activeShift()));
      await cubit.startShift();

      expect(cubit.state.lastGeoFailure, isNull);
      expect(cubit.state.geoBlockLevel, GeoBlockLevel.unknown);
      await cubit.close();
    });
  });

  group('выбор графика — организация БЕЗ гео-проверки (ранняя загрузка на '
      'idle-экране, поведение НЕ меняется фиксом geo_resolve)', () {
    // Единственная организация без гео-проверки — точка выбирается вручную
    // и известна заранее, поэтому cold-старт (buildWithOrgSelected) запускает
    // раннюю загрузку графиков.
    final org = _org(geoCheckEnabled: false);

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

        final cubit = buildWithOrgSelected(org);
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

      final cubit = buildWithOrgSelected(org);
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

        final cubit = buildWithOrgSelected(org);
        await pumpEventQueue();

        expect(cubit.state.selectedWorkScheduleId, 's1');
        expect(cubit.state.canStartShift, isTrue);
        await cubit.close();
      },
    );

    test(
      'optional + единственный закрытый график → старт без work_schedule_id',
      () async {
        final closed = _schedule(
          'closed',
          nextStartAt: _fixedNow.add(const Duration(hours: 1)),
          nextEndAt: _fixedNow.add(const Duration(hours: 10)),
        );
        when(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(
            MySchedules(items: [closed], total: 1, requireSchedule: false),
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

        final cubit = buildWithOrgSelected(org);
        await pumpEventQueue();

        expect(cubit.state.selectedWorkScheduleId, isNull);
        expect(cubit.state.canStartShift, isTrue);
        expect(await cubit.startShift(), StartShiftResult.success);
        verify(
          () => shiftRepo.startShift(
            organizationId: 'org1',
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            workScheduleId: any(named: 'workScheduleId', that: isNull),
          ),
        ).called(1);
        await cubit.close();
      },
    );

    test('открытый + закрытый графики → автоподстановка открытого', () async {
      final open = _schedule('open');
      final closed = _schedule(
        'closed',
        nextStartAt: _fixedNow.add(const Duration(hours: 1)),
        nextEndAt: _fixedNow.add(const Duration(hours: 10)),
      );
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: [closed, open], total: 2, requireSchedule: false),
        ),
      );
      when(
        () => scheduleContextStorage.read('org1', null),
      ).thenReturn('closed');

      final cubit = buildWithOrgSelected(org);
      await pumpEventQueue();

      expect(cubit.state.scheduleSelectionRequired, isFalse);
      expect(cubit.state.selectedWorkScheduleId, 'open');
      await cubit.close();
    });

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

        final cubit = buildWithOrgSelected(org);
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

    test('>1 графика с сохранённым выбором → предвыбирается, если ещё '
        'доступен', () async {
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

      final cubit = buildWithOrgSelected(org);
      await pumpEventQueue();

      expect(cubit.state.selectedWorkScheduleId, 's2');
      expect(cubit.state.canStartShift, isTrue);
      await cubit.close();
    });

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

      final cubit = buildWithOrgSelected(org);
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
      verifyNever(() => geo.getCurrentPosition());
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

      final cubit = buildWithOrgSelected(org);
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

  group('выбор графика — организация С гео-проверкой (резолв на startShift '
      'по резолвленной точке, work_schedules_geo_resolve + '
      'shift_start_location_choice)', () {
    // В отличие от организаций без гео-проверки, cold-старт с этой
    // организацией НЕ должен запускать раннюю загрузку графиков — точка
    // известна только серверу, только на startShift() (см. buildWithOrgSelected
    // выше в main()). По умолчанию (глобальный setUp) nearby отдаёт ровно
    // одну точку 'wl1' — резолв точки проходит молча, графики резолвятся по
    // workLocationId: 'wl1'.
    final orgGeoOn = _org(geoCheckEnabled: true);

    setUp(() {
      // Org с геопроверкой — рабочую точку резолвит клиент по свежим
      // координатам через work-locations/nearby (shift_start_location_choice),
      // поэтому startShift() в этой группе всегда проходит через геолокацию.
      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async => const GeoSuccess(
          latitude: 55.75,
          longitude: 37.61,
          lowAccuracy: false,
        ),
      );
    });

    test('idle-экран: org выбрана, но my-schedules НЕ запрашивается заранее '
        '(баг, который чинит эта задача)', () async {
      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      expect(cubit.state.schedules.hasData, isFalse);
      verifyNever(
        () => scheduleRepo.getMySchedules(
          any(),
          workLocationId: any(named: 'workLocationId'),
        ),
      );
      verifyNever(
        () => scheduleRepo.getMySchedules(
          any(),
          lat: any(named: 'lat'),
          lng: any(named: 'lng'),
        ),
      );
      await cubit.close();
    });

    test('0 графиков → резолв по резолвленной точке, GPS запрошен один раз, '
        'старт продолжается без графика', () async {
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => const Task<MySchedules>.success(_emptySchedules),
      );
      stubStartShift(Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final result = await cubit.startShift();

      expect(result, StartShiftResult.success);
      expect(cubit.state.selectedWorkScheduleId, isNull);
      verify(() => geo.getCurrentPosition()).called(1);
      verify(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).called(1);
      await cubit.close();
    });

    test('1 график → авто-подстановка, старт продолжается сразу без '
        'модалки, GPS запрошен один раз', () async {
      final schedule = _schedule('s1');
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: [schedule], total: 1, requireSchedule: false),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workLocationId: any(named: 'workLocationId'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final result = await cubit.startShift();

      expect(result, StartShiftResult.success);
      expect(cubit.state.selectedWorkScheduleId, 's1');
      verify(() => geo.getCurrentPosition()).called(1);
      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          latitude: 55.75,
          longitude: 37.61,
          workLocationId: 'wl1',
          workScheduleId: 's1',
        ),
      ).called(1);
      await cubit.close();
    });

    test('optional + закрытый график → geo-старт продолжается без модалки и '
        'без work_schedule_id', () async {
      final closed = _schedule(
        'closed',
        nextStartAt: _fixedNow.add(const Duration(hours: 1)),
        nextEndAt: _fixedNow.add(const Duration(hours: 10)),
      );
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: [closed], total: 1, requireSchedule: false),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workLocationId: any(named: 'workLocationId'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      expect(await cubit.startShift(), StartShiftResult.success);
      expect(cubit.state.selectedWorkScheduleId, isNull);
      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          latitude: 55.75,
          longitude: 37.61,
          workLocationId: 'wl1',
          workScheduleId: any(named: 'workScheduleId', that: isNull),
        ),
      ).called(1);
      await cubit.close();
    });

    test('geo-resolve: открытый + закрытый → старт сразу с открытым', () async {
      final open = _schedule('open');
      final closed = _schedule(
        'closed',
        nextStartAt: _fixedNow.add(const Duration(hours: 1)),
        nextEndAt: _fixedNow.add(const Duration(hours: 10)),
      );
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: [closed, open], total: 2, requireSchedule: false),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workLocationId: any(named: 'workLocationId'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      expect(await cubit.startShift(), StartShiftResult.success);
      expect(cubit.state.selectedWorkScheduleId, 'open');
      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          latitude: 55.75,
          longitude: 37.61,
          workLocationId: 'wl1',
          workScheduleId: 'open',
        ),
      ).called(1);
      await cubit.close();
    });

    test('>1 графика → startShift просит выбор (scheduleSelectionRequired), '
        'GPS запрошен один раз, старт ещё не отправлен', () async {
      final schedules = [_schedule('s1'), _schedule('s2', name: 'Ночная')];
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: schedules, total: 2, requireSchedule: false),
        ),
      );

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final result = await cubit.startShift();

      expect(result, StartShiftResult.scheduleSelectionRequired);
      expect(cubit.state.availableSchedules.map((s) => s.id), ['s1', 's2']);
      expect(cubit.state.actionStatus, FeatureStatus.initial);
      verify(() => geo.getCurrentPosition()).called(1);
      verifyNever(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      );
      await cubit.close();
    });

    test(
      '>1 графика с сохранённым выбором → предвыбирается в состоянии, но '
      'модалка ВСЁ РАВНО показывается (решение по количеству, а не по '
      'факту предвыбора — иначе сотрудник не увидит, какой график '
      'стартует, т.к. предпросмотра на idle-экране для гео-org нет)',
      () async {
        final schedules = [_schedule('s1'), _schedule('s2', name: 'Ночная')];
        when(
          () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(
            MySchedules(items: schedules, total: 2, requireSchedule: false),
          ),
        );
        when(() => scheduleContextStorage.read('org1', null)).thenReturn('s2');

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.scheduleSelectionRequired);
        expect(cubit.state.selectedWorkScheduleId, 's2');
        verifyNever(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        );
        await cubit.close();
      },
    );

    test('>1 графика: continueStartAfterScheduleSelection стартует с '
        'выбранным графиком, GPS НЕ запрашивается повторно', () async {
      final schedules = [_schedule('s1'), _schedule('s2', name: 'Ночная')];
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(items: schedules, total: 2, requireSchedule: false),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workLocationId: any(named: 'workLocationId'),
          workScheduleId: any(named: 'workScheduleId'),
        ),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final firstResult = await cubit.startShift();
      expect(firstResult, StartShiftResult.scheduleSelectionRequired);

      final continueResult = await cubit.continueStartAfterScheduleSelection(
        schedules[1],
      );

      expect(continueResult, StartShiftResult.success);
      expect(cubit.state.selectedWorkScheduleId, 's2');
      verify(() => geo.getCurrentPosition()).called(1);
      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          latitude: 55.75,
          longitude: 37.61,
          workLocationId: 'wl1',
          workScheduleId: 's2',
        ),
      ).called(1);
      verify(() => scheduleContextStorage.save('org1', null, 's2')).called(1);
      await cubit.close();
    });

    test('резолв графика падает по сети → ошибка действия, старт не '
        'отправлен', () async {
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).thenAnswer((_) async => const Task<MySchedules>.failure(_networkError));

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final result = await cubit.startShift();

      expect(result, StartShiftResult.error);
      expect(cubit.state.actionErrorCode, 'NETWORK_ERROR');
      expect(cubit.state.isActionNetworkError, isTrue);
      verifyNever(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      );
      await cubit.close();
    });

    test('SCHEDULE_NOT_AVAILABLE при старте → выбор сброшен; ретрай-перезапрос '
        'по координатам (fallback-ветка _reloadSchedulesAfterStartFailure не '
        'знает резолвленную точку повторно) находит больше графиков, GPS '
        'всё ещё запрошен только один раз', () async {
      // Первый резолв (внутри startShift, по workLocationId) находит один
      // график и авто-подставляет его; после SCHEDULE_NOT_AVAILABLE
      // перезапрос уже идёт по координатам (см. _reloadSchedulesAfterStart
      // Failure) — старая выборка не подставляется автоматически повторно.
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
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
        () => scheduleRepo.getMySchedules('org1', lat: 55.75, lng: 37.61),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          MySchedules(
            items: [
              _schedule('s2', name: 'Утро'),
              _schedule('s3', name: 'Ночь'),
            ],
            total: 2,
            requireSchedule: false,
          ),
        ),
      );
      when(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          workLocationId: any(named: 'workLocationId'),
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

      final cubit = buildWithOrgSelected(orgGeoOn);
      await pumpEventQueue();

      final result = await cubit.startShift();
      await pumpEventQueue();

      expect(result, StartShiftResult.error);
      expect(cubit.state.selectedWorkScheduleId, isNull);
      verify(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'wl1'),
      ).called(1);
      verify(
        () => scheduleRepo.getMySchedules('org1', lat: 55.75, lng: 37.61),
      ).called(1);
      verify(() => geo.getCurrentPosition()).called(1);
      await cubit.close();
    });
  });

  group(
    'выбор рабочей точки при пересечении зон (shift_start_location_choice)',
    () {
      final orgGeoOn = _org(geoCheckEnabled: true);

      setUp(() {
        when(() => geo.getCurrentPosition()).thenAnswer(
          (_) async => const GeoSuccess(
            latitude: 55.75,
            longitude: 37.61,
            lowAccuracy: false,
          ),
        );
        // Резолв графиков не важен для этой группы — 0 графиков молча
        // пропускает старт дальше в POST /shifts/start.
        when(
          () => scheduleRepo.getMySchedules(
            any(),
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => const Task<MySchedules>.success(_emptySchedules),
        );
      });

      const near = NearbyWorkLocation(
        id: 'wl-near',
        name: 'Склад №2',
        address: 'ул. Ленина, 5',
        distanceMeters: 40,
        isNearest: true,
      );
      const far = NearbyWorkLocation(
        id: 'wl-far',
        name: 'Офис',
        address: 'ул. Мира, 1',
        distanceMeters: 90,
        isNearest: false,
      );

      void stubNearby(Task<NearbyWorkLocations> result) {
        when(
          () => orgRepo.getNearbyWorkLocations(
            any(),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).thenAnswer((_) async => result);
      }

      test('1 подходящая точка → подставляется молча, модалки нет', () async {
        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(items: [near]),
          ),
        );
        stubStartShift(Task<Shift>.success(_activeShift()));

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.success);
        expect(cubit.state.selectedWorkLocation?.id, 'wl-near');
        verify(
          () => shiftRepo.startShift(
            organizationId: 'org1',
            latitude: 55.75,
            longitude: 37.61,
            workLocationId: 'wl-near',
          ),
        ).called(1);
        await cubit.close();
      });

      test(
        '>1 подходящих точек → workLocationSelectionRequired, порядок '
        'сервера сохранён, первая помечена ближайшей, старт ещё не отправлен',
        () async {
          stubNearby(
            const Task<NearbyWorkLocations>.success(
              NearbyWorkLocations(items: [near, far]),
            ),
          );

          final cubit = buildWithOrgSelected(orgGeoOn);
          await pumpEventQueue();

          final result = await cubit.startShift();

          expect(result, StartShiftResult.workLocationSelectionRequired);
          expect(cubit.state.actionStatus, FeatureStatus.initial);
          expect(cubit.state.nearbyWorkLocations.map((l) => l.id), [
            'wl-near',
            'wl-far',
          ]);
          expect(cubit.state.nearbyWorkLocations.first.isNearest, isTrue);
          verifyNever(
            () => shiftRepo.startShift(
              organizationId: any(named: 'organizationId'),
              latitude: any(named: 'latitude'),
              longitude: any(named: 'longitude'),
            ),
          );
          await cubit.close();
        },
      );

      test(
        'continueStartAfterWorkLocationSelection стартует с ВЫБРАННОЙ (не '
        'обязательно ближайшей) точкой, GPS не запрашивается повторно',
        () async {
          stubNearby(
            const Task<NearbyWorkLocations>.success(
              NearbyWorkLocations(items: [near, far]),
            ),
          );
          stubStartShift(Task<Shift>.success(_activeShift()));

          final cubit = buildWithOrgSelected(orgGeoOn);
          await pumpEventQueue();

          final firstResult = await cubit.startShift();
          expect(firstResult, StartShiftResult.workLocationSelectionRequired);

          // Сотрудник выбрал НЕ предвыбранную ближайшую, а вторую точку.
          final continueResult = await cubit
              .continueStartAfterWorkLocationSelection(far);

          expect(continueResult, StartShiftResult.success);
          expect(cubit.state.selectedWorkLocation?.id, 'wl-far');
          verify(() => geo.getCurrentPosition()).called(1);
          verify(
            () => shiftRepo.startShift(
              organizationId: 'org1',
              latitude: 55.75,
              longitude: 37.61,
              workLocationId: 'wl-far',
            ),
          ).called(1);
          await cubit.close();
        },
      );

      test('0 подходящих точек → noNearbyWorkLocation, подсказка о ближайшей '
          'точке вне радиуса сохранена, старт не отправлен', () async {
        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(
              items: [],
              nearestOutside: NearestOutsideWorkLocation(
                name: 'Офис',
                distanceMeters: 320,
              ),
            ),
          ),
        );

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.noNearbyWorkLocation);
        expect(cubit.state.actionStatus, FeatureStatus.initial);
        expect(cubit.state.nearestOutsideHint?.name, 'Офис');
        expect(cubit.state.nearestOutsideHint?.distanceMeters, 320);
        verifyNever(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        );
        await cubit.close();
      });

      test('0 подходящих точек без nearest_outside → подсказки нет', () async {
        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(items: []),
          ),
        );

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.noNearbyWorkLocation);
        expect(cubit.state.nearestOutsideHint, isNull);
        await cubit.close();
      });

      test('повтор после noNearbyWorkLocation запускает сценарий заново: '
          'свежий GPS + новый запрос nearby', () async {
        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(items: []),
          ),
        );

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        expect(await cubit.startShift(), StartShiftResult.noNearbyWorkLocation);

        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(items: [near]),
          ),
        );
        stubStartShift(Task<Shift>.success(_activeShift()));

        expect(await cubit.startShift(), StartShiftResult.success);

        verify(() => geo.getCurrentPosition()).called(2);
        verify(
          () => orgRepo.getNearbyWorkLocations(
            'org1',
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        ).called(2);
        await cubit.close();
      });

      test('getNearbyWorkLocations падает по сети → ошибка действия, старт не '
          'отправлен', () async {
        stubNearby(const Task<NearbyWorkLocations>.failure(_networkError));

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.error);
        expect(cubit.state.actionErrorCode, 'NETWORK_ERROR');
        verifyNever(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
          ),
        );
        await cubit.close();
      });

      test('WORK_LOCATION_OUT_OF_RANGE от POST /shifts/start (гонка «список '
          'устарел») → точка и график сброшены, ошибка действия', () async {
        stubNearby(
          const Task<NearbyWorkLocations>.success(
            NearbyWorkLocations(items: [near]),
          ),
        );
        when(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            workLocationId: any(named: 'workLocationId'),
          ),
        ).thenAnswer(
          (_) async => const Task<Shift>.failure(
            ApiException.server(
              message: 'Вы находитесь вне выбранной рабочей точки',
              code: 'WORK_LOCATION_OUT_OF_RANGE',
            ),
          ),
        );

        final cubit = buildWithOrgSelected(orgGeoOn);
        await pumpEventQueue();

        final result = await cubit.startShift();

        expect(result, StartShiftResult.error);
        expect(cubit.state.actionErrorCode, 'WORK_LOCATION_OUT_OF_RANGE');
        expect(cubit.state.selectedWorkLocation, isNull);
        expect(cubit.state.selectedWorkScheduleId, isNull);
        await cubit.close();
      });
    },
  );

  group('обновление настроек организации при возврате на экран/вкладку '
      '(shift_start_location_choice)', () {
    setUp(() {
      when(() => contextStorage.save(any())).thenAnswer((_) async {});
    });

    test(
      'onScreenVisible перечитывает организации — geoCheckEnabled, '
      'переключённый админом, подхватывается без выхода из приложения',
      () async {
        final orgOff = _org(geoCheckEnabled: false);
        final orgOn = orgOff.copyWith(geoCheckEnabled: true);
        final orgsStream = StreamController<List<Organization>>.broadcast();
        when(
          () => orgRepo.watchMyOrganizations(),
        ).thenAnswer((_) => orgsStream.stream);
        when(() => orgRepo.fetchMyOrganizations()).thenAnswer((_) async {
          orgsStream.add([orgOn]);
        });

        final cubit = buildCubit();
        orgsStream.add([orgOff]);
        await pumpEventQueue();
        cubit.selectOrganization('org1');

        expect(cubit.state.showWorkLocationSelector, isTrue);

        cubit.onScreenVisible();
        await pumpEventQueue();

        expect(cubit.state.selectedOrganization?.geoCheckEnabled, isTrue);
        expect(cubit.state.showWorkLocationSelector, isFalse);
        // 1 вызов — из ShiftTrackerCubit._init() при создании кубита, 2-й —
        // из onScreenVisible().
        verify(() => orgRepo.fetchMyOrganizations()).called(2);
        await orgsStream.close();
        await cubit.close();
      },
    );

    test('onAppResumed тоже перечитывает организации', () async {
      final cubit = await buildWithActiveShift(_activeShift());

      cubit.onAppResumed();
      await pumpEventQueue();

      // 1 вызов — из _init() при создании кубита, 2-й — из onAppResumed().
      verify(() => orgRepo.fetchMyOrganizations()).called(2);
      await cubit.close();
    });
  });

  group('окно графика (schedule_window_enforcement)', () {
    // Организация без гео-проверки — графики грузятся заранее на idle-экране
    // (см. группу «выбор графика — БЕЗ гео-проверки» выше), поэтому именно
    // на ней воспроизводим сценарий с прода из mobile.md.
    final org = _org(geoCheckEnabled: false);

    void stubSchedules(MySchedules Function() build) {
      when(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).thenAnswer((_) async => Task<MySchedules>.success(build()));
    }

    test(
      'кнопка гаснет при переходе через next_end_at без перезапроса экрана',
      () {
        fakeAsync((async) {
          // Прод-сценарий из mobile.md: график 21:48–21:52, early=0.
          final windowStart = DateTime.utc(2026, 8, 16, 21, 48);
          final windowEnd = DateTime.utc(2026, 8, 16, 21, 52);
          stubSchedules(
            () => MySchedules(
              items: [
                _schedule('s1', nextStartAt: windowStart, nextEndAt: windowEnd),
              ],
              total: 1,
              requireSchedule: true,
            ),
          );

          final cubit = buildWithOrgSelected(
            org,
            now: () => windowStart.add(async.elapsed),
          );
          async.flushMicrotasks();

          expect(cubit.state.selectedWorkScheduleId, 's1');
          expect(cubit.state.canStartShift, isTrue);

          // Ни одного явного действия пользователя/перезапроса экрана —
          // только течение времени внутри уже запущенного тикера кубита.
          async.elapse(const Duration(minutes: 4, seconds: 1));

          expect(cubit.state.canStartShift, isFalse);
          expect(cubit.state.scheduleBlockedWindowClosed, isTrue);
          expect(cubit.state.scheduleWindowReasonSource?.id, 's1');

          cubit.close();
          async.flushMicrotasks();
        });
      },
    );

    test(
      'кнопка загорается при наступлении next_start_at − early_start_minutes',
      () {
        fakeAsync((async) {
          final nextStart = DateTime.utc(2026, 8, 16, 21, 48);
          final nextEnd = DateTime.utc(2026, 8, 16, 21, 52);
          stubSchedules(
            () => MySchedules(
              items: [
                _schedule('s1', nextStartAt: nextStart, nextEndAt: nextEnd),
              ],
              total: 1,
              requireSchedule: true,
              earlyStartMinutes: 15,
            ),
          );

          // 21:20 — раньше допустимого 21:33 (21:48 − 15 мин).
          final start = DateTime.utc(2026, 8, 16, 21, 20);
          final cubit = buildWithOrgSelected(
            org,
            now: () => start.add(async.elapsed),
          );
          async.flushMicrotasks();

          expect(cubit.state.canStartShift, isFalse);
          expect(cubit.state.scheduleBlockedWindowClosed, isTrue);

          async.elapse(const Duration(minutes: 13, seconds: 1));

          expect(cubit.state.selectedWorkScheduleId, 's1');
          expect(cubit.state.canStartShift, isTrue);
          expect(cubit.state.scheduleBlockedWindowClosed, isFalse);

          cubit.close();
          async.flushMicrotasks();
        });
      },
    );

    test('выбранный график сбрасывается, когда его окно закрылось', () {
      fakeAsync((async) {
        final windowStart = DateTime.utc(2026, 8, 16, 21, 48);
        final windowEnd = DateTime.utc(2026, 8, 16, 21, 52);
        stubSchedules(
          () => MySchedules(
            items: [
              _schedule('s1', nextStartAt: windowStart, nextEndAt: windowEnd),
            ],
            total: 1,
            // require_schedule=false — сброс выбора не зависит от настройки
            // (mobile.md, п.1), а старт остаётся доступен и без графика
            // (backend.md, S2, правило 5).
            requireSchedule: false,
          ),
        );

        final cubit = buildWithOrgSelected(
          org,
          now: () => windowStart.add(async.elapsed),
        );
        async.flushMicrotasks();

        expect(cubit.state.selectedWorkScheduleId, 's1');

        async.elapse(const Duration(minutes: 4, seconds: 1));

        expect(cubit.state.selectedWorkScheduleId, isNull);
        expect(cubit.state.canStartShift, isTrue);

        cubit.close();
        async.flushMicrotasks();
      });
    });

    test(
      'окно закрылось → my-schedules перезапрашивается один раз (дебаунс)',
      () {
        fakeAsync((async) {
          final windowStart = DateTime.utc(2026, 8, 16, 21, 48);
          final windowEnd = DateTime.utc(2026, 8, 16, 21, 52);
          var call = 0;
          stubSchedules(() {
            call++;
            // Бэк всегда отдаёт окно, конец которого ещё впереди (R2,
            // backend.md) — второй и последующие ответы уже про завтра.
            final offset = call == 1 ? Duration.zero : const Duration(days: 1);
            return MySchedules(
              items: [
                _schedule(
                  's1',
                  nextStartAt: windowStart.add(offset),
                  nextEndAt: windowEnd.add(offset),
                ),
              ],
              total: 1,
              requireSchedule: true,
            );
          });

          buildWithOrgSelected(org, now: () => windowStart.add(async.elapsed));
          async.flushMicrotasks();
          expect(call, 1);

          async.elapse(const Duration(minutes: 4, seconds: 6));
          expect(call, 2);

          // Дальнейшее течение времени сегодняшнего дня не долбит бэк снова —
          // ближайшее окно из свежего ответа теперь завтрашнее.
          async.elapse(const Duration(seconds: 10));
          expect(call, 2);
        });
      },
    );

    test('SCHEDULE_WINDOW_CLOSED при старте → выбор сброшен, графики '
        'перезапрошены', () async {
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
            : [_schedule('s1'), _schedule('s2', name: 'Ночная')];
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
            message: 'график сейчас не действует',
            code: 'SCHEDULE_WINDOW_CLOSED',
          ),
        ),
      );

      final cubit = buildWithOrgSelected(org);
      await pumpEventQueue();
      expect(cubit.state.selectedWorkScheduleId, 's1');

      final result = await cubit.startShift();
      await pumpEventQueue();

      expect(result, StartShiftResult.error);
      expect(cubit.state.actionErrorCode, 'SCHEDULE_WINDOW_CLOSED');
      expect(cubit.state.selectedWorkScheduleId, isNull);
      verify(
        () => scheduleRepo.getMySchedules(
          'org1',
          workLocationId: any(named: 'workLocationId'),
        ),
      ).called(2);
      await cubit.close();
    });

    test('смена авто-завершилась во время фонового поллинга → графики '
        'перезапрашиваются вместе с возвратом в idle', () {
      fakeAsync((async) {
        stubSchedules(
          () => MySchedules(
            items: [_schedule('s1')],
            total: 1,
            requireSchedule: false,
          ),
        );
        final shift = Shift(
          id: 'shift1',
          userId: 'u1',
          startedAt: _fixedNow,
          status: ShiftStatus.active,
          pauses: const [],
          workedSeconds: 0,
        );
        when(
          () => shiftRepo.startShift(
            organizationId: any(named: 'organizationId'),
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            workScheduleId: any(named: 'workScheduleId'),
          ),
        ).thenAnswer((_) async => Task<Shift>.success(shift));

        final cubit = buildWithOrgSelected(org);
        async.flushMicrotasks();
        expect(cubit.state.selectedOrganizationId, 'org1');
        expect(cubit.state.selectedWorkScheduleId, 's1');

        unawaited(cubit.startShift());
        async.flushMicrotasks();
        expect(cubit.state.hasActiveShift, isTrue);

        // Бэк уже авто-завершил смену к моменту фонового опроса.
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.paused, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));

        // 60-секундный фоновый поллинг активной смены
        // (см. ShiftTrackerCubit._pollSeconds) — без единого действия
        // пользователя, тот самый сценарий с прода из mobile.md.
        async.elapse(const Duration(seconds: 61));

        expect(cubit.state.hasActiveShift, isFalse);
        expect(cubit.state.shiftAutoFinished, isTrue);
        expect(cubit.state.selectedWorkScheduleId, 's1');
        verify(
          () => scheduleRepo.getMySchedules(
            'org1',
            workLocationId: any(named: 'workLocationId'),
          ),
        ).called(2);

        cubit.close();
        async.flushMicrotasks();
      });
    });
  });

  group('предвыбор контекста — инверсия дефолта (shift_org_default)', () {
    Organization orgWithRole(
      String id, {
      String name = 'Org',
      OrgMembershipRole? myRole,
    }) => Organization(
      id: id,
      name: name,
      ownerId: 'owner1',
      inviteCode: 'INV$id',
      isDeleted: false,
      createdAt: DateTime.utc(2026),
      myRole: myRole,
    );

    ShiftTrackerCubit buildWithOrgs(List<Organization> orgs) {
      when(
        () => orgRepo.watchMyOrganizations(),
      ).thenAnswer((_) => Stream<List<Organization>>.value(orgs));
      return buildCubit();
    }

    setUp(() {
      when(() => contextStorage.save(any())).thenAnswer((_) async {});
      when(() => contextStorage.clear()).thenAnswer((_) async {});
    });

    test('2 и более организаций без сохранённого контекста → первая доступная '
        '(раньше дефолтом была персональная — тот самый баг)', () async {
      final orgs = [
        orgWithRole('org1', name: 'Org 1', myRole: OrgMembershipRole.employee),
        orgWithRole('org2', name: 'Org 2', myRole: OrgMembershipRole.admin),
      ];

      final cubit = buildWithOrgs(orgs);
      await pumpEventQueue();

      expect(cubit.state.selectedOrganizationId, 'org1');
      expect(cubit.state.isOrgShift, isTrue);
      await cubit.close();
    });

    test('сохранённый org_id исчез из доступных → молча первая доступная '
        '(без ошибки)', () async {
      when(() => contextStorage.read()).thenReturn('gone');
      final orgs = [
        orgWithRole('org1', name: 'Org 1', myRole: OrgMembershipRole.employee),
        orgWithRole('org2', name: 'Org 2', myRole: OrgMembershipRole.employee),
      ];

      final cubit = buildWithOrgs(orgs);
      await pumpEventQueue();

      expect(cubit.state.selectedOrganizationId, 'org1');
      await cubit.close();
    });

    test('сохранённый легаси-маркер `personal` игнорируется и чистится → '
        'действует правило A (организация, не персональная)', () async {
      when(
        () => contextStorage.read(),
      ).thenReturn(ShiftContextStorage.personalMarker);
      final org = orgWithRole('org1', myRole: OrgMembershipRole.employee);

      final cubit = buildWithOrgs([org]);
      await pumpEventQueue();

      expect(cubit.state.selectedOrganizationId, 'org1');
      verify(() => contextStorage.clear()).called(1);
      await cubit.close();
    });

    test('организация, где пользователь только владелец, не входит в '
        'доступные и не предвыбирается (ADR-001 — owner не member, старт дал '
        'бы 403)', () async {
      final ownerOrg = orgWithRole('org1', myRole: OrgMembershipRole.owner);

      final cubit = buildWithOrgs([ownerOrg]);
      await pumpEventQueue();

      expect(cubit.state.availableOrganizations, isEmpty);
      expect(cubit.state.hasOrganizations, isFalse);
      expect(cubit.state.selectedOrganizationId, isNull);
      await cubit.close();
    });

    test('владелец в одной организации и сотрудник в другой → доступна только '
        'та, где не owner', () async {
      final ownerOrg = orgWithRole('org1', myRole: OrgMembershipRole.owner);
      final employeeOrg = orgWithRole(
        'org2',
        name: 'Org 2',
        myRole: OrgMembershipRole.employee,
      );

      final cubit = buildWithOrgs([ownerOrg, employeeOrg]);
      await pumpEventQueue();

      expect(cubit.state.availableOrganizations.map((o) => o.id), ['org2']);
      expect(cubit.state.selectedOrganizationId, 'org2');
      await cubit.close();
    });

    test('доступных организаций нет → персональный контекст, ничего не '
        'предвыбирается', () async {
      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.hasOrganizations, isFalse);
      expect(cubit.state.selectedOrganizationId, isNull);
      await cubit.close();
    });
  });

  group('персональная смена при активном орг-контексте (shift_org_default, '
      'блок B)', () {
    final org = _org(geoCheckEnabled: false);

    setUp(() {
      when(() => contextStorage.save(any())).thenAnswer((_) async {});
      when(() => contextStorage.clear()).thenAnswer((_) async {});
    });

    test('успех: org-контекст на экране не трогается, storage чистится, гео '
        'не запрашивается', () async {
      // Персональный старт вызывает startShift() совсем без аргументов
      // (см. ShiftTrackerCubit.startPersonalShift) — стаб без named-стрелок.
      when(
        () => shiftRepo.startShift(),
      ).thenAnswer((_) async => Task<Shift>.success(_activeShift()));

      final cubit = buildWithOrgSelected(org);
      await pumpEventQueue();
      expect(cubit.state.selectedOrganizationId, 'org1');

      final result = await cubit.startPersonalShift();

      expect(result, StartShiftResult.success);
      expect(cubit.state.hasActiveShift, isTrue);
      // Контекст на экране не поменялся — после finishShift снова org1.
      expect(cubit.state.selectedOrganizationId, 'org1');
      verify(() => contextStorage.clear()).called(1);
      verifyNever(() => geo.getCurrentPosition());
      await cubit.close();
    });

    test('сеть падает → ошибка действия, ретрай повторяет именно '
        'персональный старт', () async {
      var calls = 0;
      when(() => shiftRepo.startShift()).thenAnswer((_) async {
        calls++;
        return calls == 1
            ? const Task<Shift>.failure(_networkError)
            : Task<Shift>.success(_activeShift());
      });

      final cubit = buildWithOrgSelected(org);
      await pumpEventQueue();

      final result = await cubit.startPersonalShift();

      expect(result, StartShiftResult.error);
      expect(cubit.state.isActionNetworkError, isTrue);

      await cubit.retryLastAction();

      expect(cubit.state.actionStatus, FeatureStatus.success);
      expect(cubit.state.hasActiveShift, isTrue);
      await cubit.close();
    });
  });

  group('блок дозаполнения чек-листа (checklist_grace_period)', () {
    Shift finishedShift({
      bool hasIncompleteRequiredChecklists = true,
      String organizationId = 'org1',
    }) => Shift(
      id: 's1',
      userId: 'u1',
      startedAt: _fixedNow.subtract(const Duration(hours: 8)),
      status: ShiftStatus.finished,
      pauses: const [],
      workedSeconds: 8 * 3600,
      organizationId: organizationId,
      finishedAt: _fixedNow,
      hasIncompleteRequiredChecklists: hasIncompleteRequiredChecklists,
    );

    ChecklistInstance instance({
      bool fillAllowed = true,
      DateTime? fillDeadlineAt,
    }) => ChecklistInstance(
      id: 'ci1',
      name: 'Чек-лист при завершении',
      type: ChecklistType.shiftEnd,
      isRequired: true,
      status: ChecklistInstanceStatus.incomplete,
      itemsSummary: const ChecklistItemsSummary(total: 2, completed: 0),
      createdAt: _fixedNow.subtract(const Duration(hours: 8)),
      fillAllowed: fillAllowed,
      fillDeadlineAt: fillDeadlineAt,
    );

    void stubLastFinished(Shift shift) {
      when(
        () => shiftRepo.getShifts(status: ShiftStatus.finished, limit: 1),
      ).thenAnswer((_) async => _shiftsPage([shift]));
    }

    void stubChecklists(List<ChecklistInstance> items) {
      when(
        () => checklistRepo.getShiftChecklists(any()),
      ).thenAnswer((_) async => Task<List<ChecklistInstance>>.success(items));
    }

    test('нет незакрытых обязательных пунктов → блока нет, второй запрос '
        '(деталь чек-листов) не делается', () async {
      stubLastFinished(finishedShift(hasIncompleteRequiredChecklists: false));

      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.showChecklistGraceBlock, isFalse);
      verifyNever(() => checklistRepo.getShiftChecklists(any()));
      await cubit.close();
    });

    test(
      'есть незакрытые обязательные пункты, окно открыто → блок '
      'показывается с серверным дедлайном (не вычисленным на клиенте)',
      () async {
        final deadline = _fixedNow.add(const Duration(minutes: 24));
        stubLastFinished(finishedShift());
        stubChecklists([instance(fillDeadlineAt: deadline)]);

        final cubit = buildCubit();
        await pumpEventQueue();

        expect(cubit.state.showChecklistGraceBlock, isTrue);
        expect(cubit.state.checklistGraceShift?.id, 's1');
        expect(cubit.state.checklistGraceDeadlineAt, deadline);
        expect(
          cubit.state.checklistGraceRemaining,
          const Duration(minutes: 24),
        );
        await cubit.close();
      },
    );

    test('обязательные пункты не закрыты, но окно уже истекло (fill_allowed '
        'false у сервера) → блока нет', () async {
      stubLastFinished(finishedShift());
      stubChecklists([instance(fillAllowed: false)]);

      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.showChecklistGraceBlock, isFalse);
      await cubit.close();
    });

    test(
      'обратный отсчёт тикает и гасит блок по истечении без нового запроса',
      () {
        fakeAsync((async) {
          final deadline = _fixedNow.add(const Duration(minutes: 2));
          stubLastFinished(finishedShift());
          stubChecklists([instance(fillDeadlineAt: deadline)]);

          final cubit = buildCubit(now: () => _fixedNow.add(async.elapsed));
          async.flushMicrotasks();

          expect(cubit.state.showChecklistGraceBlock, isTrue);
          expect(
            cubit.state.checklistGraceRemaining,
            const Duration(minutes: 2),
          );

          async.elapse(const Duration(minutes: 1));
          expect(
            cubit.state.checklistGraceRemaining,
            const Duration(minutes: 1),
          );
          expect(cubit.state.showChecklistGraceBlock, isTrue);

          async.elapse(const Duration(minutes: 1, seconds: 1));
          expect(cubit.state.showChecklistGraceBlock, isFalse);
          expect(cubit.state.checklistGraceShift, isNull);

          cubit.close();
          async.flushMicrotasks();
        });
      },
    );

    test('finishShift() успешно → сразу проверяет окно дозаполнения новой '
        'завершённой смены, не дожидаясь резюма/pull-to-refresh', () async {
      final shift = finishedShift();
      when(
        () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
      ).thenAnswer((_) async => _shiftsPage([_activeShift()]));
      when(
        () => shiftRepo.finishShift('s1'),
      ).thenAnswer((_) async => Task<Shift>.success(shift));
      final deadline = _fixedNow.add(const Duration(minutes: 30));
      stubLastFinished(shift);
      stubChecklists([instance(fillDeadlineAt: deadline)]);

      final cubit = buildCubit();
      await pumpEventQueue();
      expect(cubit.state.hasActiveShift, isTrue);

      final ok = await cubit.finishShift();
      await pumpEventQueue();

      expect(ok, isTrue);
      expect(cubit.state.showChecklistGraceBlock, isTrue);
      expect(cubit.state.checklistGraceDeadlineAt, deadline);
      await cubit.close();
    });

    test('авто-завершение фоновым поллингом → тоже проверяет окно '
        'дозаполнения (окно распространяется и на авто-завершённые смены)', () {
      fakeAsync((async) {
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer((_) async => _shiftsPage([_activeShift()]));

        final cubit = buildCubit();
        async.flushMicrotasks();
        expect(cubit.state.hasActiveShift, isTrue);

        // Бэк уже авто-завершил смену к моменту фонового опроса.
        final shift = finishedShift();
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.active, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));
        when(
          () => shiftRepo.getShifts(status: ShiftStatus.paused, limit: 1),
        ).thenAnswer((_) async => _shiftsPage(const []));
        final deadline = _fixedNow.add(const Duration(minutes: 15));
        stubLastFinished(shift);
        stubChecklists([instance(fillDeadlineAt: deadline)]);

        // 60-секундный фоновый поллинг активной смены
        // (ShiftTrackerCubit._pollSeconds).
        async.elapse(const Duration(seconds: 61));

        expect(cubit.state.hasActiveShift, isFalse);
        expect(cubit.state.shiftAutoFinished, isTrue);
        expect(cubit.state.showChecklistGraceBlock, isTrue);
        expect(cubit.state.checklistGraceDeadlineAt, deadline);

        cubit.close();
        async.flushMicrotasks();
      });
    });
  });
}
