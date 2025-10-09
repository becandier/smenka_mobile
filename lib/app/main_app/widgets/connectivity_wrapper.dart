import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:templatecmd/l10n/localization_extension.dart';

@Deprecated('''
Есть баг с context ScaffoldMessenger. 
Используйте альтернативный подход для обработки подключения.
''')
class ConnectivityWrapper extends StatefulWidget {
  const ConnectivityWrapper({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late final Connectivity _connectivity;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
  }

  void _showInfoConnectivly(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: _connectivity.onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data?.contains(ConnectivityResult.vpn) ?? false) {
          _showInfoConnectivly(context.l10n.vpnEnabled);
        } else if (snapshot.data?.contains(ConnectivityResult.none) ?? false) {
          _showInfoConnectivly(context.l10n.deviceNotConnected);
        }
        return widget.child;
      },
    );
  }
}
