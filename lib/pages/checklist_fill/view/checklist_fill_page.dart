import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_cubit.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_state.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_photo_draft.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_fill_item_tile.dart';
part '../widgets/_item_photos_section.dart';

@RoutePage()
class ChecklistFillPage extends StatelessWidget {
  const ChecklistFillPage({
    @pathParam required this.shiftId,
    @pathParam required this.instanceId,
    this.organizationId,
    this.readOnly = false,
    super.key,
  });

  final String shiftId;
  final String instanceId;

  /// Организация смены — нужна для загрузки фото (`POST /files`). `null` на
  /// чужой/завершённой смене (read-only) допустим: мутации скрыты.
  final String? organizationId;

  /// Только просмотр (без редактирования пунктов и фото) — деталь чужой или
  /// завершённой смены.
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChecklistFillCubit(
        shiftId: shiftId,
        instanceId: instanceId,
        organizationId: organizationId,
        readOnly: readOnly,
        checklistRepository: context.read<ChecklistRepository>(),
        filesRepository: context.read<FilesRepository>(),
        geoService: GeoService(),
      ),
      child: const _ChecklistFillView(),
    );
  }
}

class _ChecklistFillView extends StatelessWidget {
  const _ChecklistFillView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return MultiBlocListener(
      listeners: [
        BlocListener<ChecklistFillCubit, ChecklistFillState>(
          listenWhen: (p, c) => p.notice != c.notice && c.notice != null,
          listener: (context, state) {
            switch (state.notice) {
              case PhotoNotice.geoUnavailable:
                context.modals.showInfo(l10n.checklistPhotoGeoUnavailable);
              case PhotoNotice.shiftFinished:
                context.modals.showWarning(l10n.checklistPhotoShiftFinished);
              case null:
                break;
            }
            context.read<ChecklistFillCubit>().clearNotice();
          },
        ),
        BlocListener<ChecklistFillCubit, ChecklistFillState>(
          listenWhen: (p, c) =>
              p.actionErrorCode != c.actionErrorCode &&
              c.actionErrorCode != null,
          listener: (context, state) {
            context.modals.showError(
              localizedErrorMessage(context, code: state.actionErrorCode),
            );
            context.read<ChecklistFillCubit>().clearActionError();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ChecklistFillCubit, ChecklistFillState>(
            buildWhen: (p, c) => p.instance.data?.name != c.instance.data?.name,
            builder: (context, state) =>
                Text(state.instance.data?.name ?? l10n.checklistFillTitle),
          ),
          centerTitle: true,
        ),
        body:
            SectionDataWrapper<
              ChecklistFillCubit,
              ChecklistFillState,
              ChecklistInstanceDetail
            >(
              selector: (state) => state.instance,
              onRetry: () => context.read<ChecklistFillCubit>().loadInstance(),
              contentBuilder: (detail) {
                final sorted = [...detail.items]
                  ..sort((a, b) => a.position.compareTo(b.position));
                final completed = sorted.where((i) => i.isCompleted).length;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 12,
                        bottom: 8,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.task_alt,
                            color: appColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.shiftChecklistProgress(
                              completed,
                              sorted.length,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: appColors.primary),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: sorted.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) =>
                            _FillItemTile(item: sorted[index]),
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
