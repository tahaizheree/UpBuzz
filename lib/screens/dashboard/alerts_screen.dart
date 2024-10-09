import 'package:flutter/material.dart';
import 'package:upalerts/screens/dashboard/alertScreenWidgets/no_alert.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoAlertScreen(activeScreen: "alert");
  }
}
