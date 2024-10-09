import 'package:flutter/material.dart';
import 'package:upalerts/screens/dashboard/alertScreenWidgets/no_alert.dart';

class ActivitiesScreen extends StatelessWidget{
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoAlertScreen(activeScreen: "activities");
  }
}