part of '../view/add_edit_location_page.dart';

class _CenterMarker extends StatelessWidget {
  const _CenterMarker();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 48),
          child: Icon(Icons.location_on, size: 48, color: Colors.red),
        ),
      ),
    );
  }
}
