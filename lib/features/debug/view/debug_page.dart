import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:templatecmd/app/config/_config.dart';
import 'package:templatecmd/app/main_app/cubit/_cubit.dart';
import 'package:templatecmd/core/constants/feature_statuses.dart';
import 'package:templatecmd/features/debug/cubit/debug_cubit.dart';
import 'package:templatecmd/features/debug/data/repository/_repository.dart';
import 'package:templatecmd/l10n/localization_extension.dart';

@RoutePage()
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebugCubit(
        debugRepository: context.read<IDebugRepositoryImp>(),
      )..fetchFlavor(),
      child: const _DebugView(),
    );
  }
}

class _DebugView extends StatelessWidget {
  const _DebugView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DebugCubit, DebugState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.debugMode),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<MainAppCubit>().init();
            },
            child: const Icon(Icons.refresh),
          ),
          body: state.status == FeatureStatus.loading
              ? const CircularProgressIndicator.adaptive()
              : _DebugContent(
                  flavor: state.flavor,
                ),
        );
      },
    );
  }
}

class _DebugContent extends StatelessWidget {
  const _DebugContent({
    required this.flavor,
  });

  final Flavors? flavor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.developer_mode),
          title: Text(context.l10n.flavor),
          subtitle: Text(flavor?.name ?? ''),
          onTap: () => showDialog<void>(
            context: context,
            builder: (_) => SimpleDialog(
              title: Text(context.l10n.flavor),
              children: Flavors.values
                  .map(
                    (e) => RadioListTile(
                      title: Text(e.name),
                      value: e,
                      groupValue: flavor,
                      onChanged: (value) {
                        if (value == null) return;
                        context.read<DebugCubit>().setFlavor(value);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: Text(context.l10n.logs),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => context.router.pushWidget(
            TalkerScreen(
              talker: context.read<Talker>(),
            ),
          ),
        ),
      ],
    );
  }
}
