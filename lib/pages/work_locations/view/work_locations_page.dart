import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';
import 'package:smenka_mobile/data/domain/location/repositories/location_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/work_locations/cubit/locations_cubit.dart';
import 'package:smenka_mobile/pages/work_locations/cubit/locations_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_location_tile.dart';

@RoutePage()
class WorkLocationsPage extends StatelessWidget {
  const WorkLocationsPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationsCubit(
        orgId: orgId,
        locationRepository: context.read<LocationRepository>(),
      ),
      child: const _WorkLocationsView(),
    );
  }
}

class _WorkLocationsView extends StatelessWidget {
  const _WorkLocationsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.workLocationsTitle),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddLocation(context),
        child: const Icon(Icons.add),
      ),
      body: SectionDataWrapper<LocationsCubit, LocationsState,
          List<WorkLocation>>(
        selector: (state) => state.locations,
        onRetry: () => context.read<LocationsCubit>().loadLocations(),
        contentBuilder: (locations) {
          if (locations.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  l10n.workLocationsEmpty,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: context.appColors.secondary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return RefreshIndicator.adaptive(
            onRefresh: () => context.read<LocationsCubit>().loadLocations(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: locations.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _LocationTile(location: locations[index]),
            ),
          );
        },
      ),
    );
  }

  Future<void> _navigateToAddLocation(BuildContext context) async {
    final cubit = context.read<LocationsCubit>();
    await context.router.push(AddEditLocationRoute(orgId: cubit.orgId));
    unawaited(cubit.loadLocations());
  }
}
