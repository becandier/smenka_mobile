import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templatecmd/data/api/azkar/azkar_api.dart';
import 'package:templatecmd/data/entity/_entity.dart';
import 'package:templatecmd/data/entity/azkar.dart';
import 'package:templatecmd/data/repository/azkar/azkar_repository_impl.dart';
import 'package:templatecmd/features/azkars/cubit/azkar_cubit.dart';
import 'package:templatecmd/l10n/_l10n.dart';

@RoutePage()
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AzkarRepositoryImpl(
        api: AzkarApi(
          client: context.read<Dio>(),
        ),
      ),
      child: BlocProvider(
        create: (context) => AzkarsCubit(
          azkarRepository: context.read<AzkarRepositoryImpl>(),
        ),
        child: const _AzkarsView(),
      ),
    );
  }
}

class _AzkarsView extends StatelessWidget {
  const _AzkarsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.azkars),
      ),
      body: BlocBuilder<AzkarsCubit, AzkarsState>(
        builder: (context, state) {
          return switch (state) {
            Loading() =>
              const Center(child: CircularProgressIndicator.adaptive()),
            Success() => _AzkarsContent(azkars: state.azkars),
          };
        },
      ),
    );
  }
}

class _AzkarsContent extends StatelessWidget {
  const _AzkarsContent({required this.azkars});
  final List<AzkarE> azkars;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = azkars[index];
        return ListTile(
          title: Text(item.text),
          subtitle: Text(item.description ?? ''),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(
        height: 10,
      ),
      itemCount: azkars.length,
    );
  }
}
