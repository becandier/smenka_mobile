// ignore_for_file: document_ignores

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templatecmd/app/main_app/cubit/_cubit.dart';
import 'package:templatecmd/l10n/localization_extension.dart';

class TechWorksWrapper extends StatefulWidget {
  const TechWorksWrapper({
    required this.child,
    required this.techWorks,
    required this.navigatorKey,
    super.key,
  });
  final Widget child;
  final bool techWorks;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<TechWorksWrapper> createState() => _TechWorksWrapperState();
}

class _TechWorksWrapperState extends State<TechWorksWrapper> {
  @override
  void initState() {
    if (widget.techWorks) {
      Future.delayed(
        const Duration(seconds: 2),
        // ignore: use_build_context_synchronously
        _showTechWorksBottomSheet,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _showTechWorksBottomSheet() async {
    await showModalBottomSheet<void>(
      context: widget.navigatorKey!.currentState!.context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.techWorks,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.techWorksDescription,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<MainAppCubit>().init();
                },
                child: Text(context.l10n.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
