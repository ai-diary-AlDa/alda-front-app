import 'package:alda_front/themes/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.beige,
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Calendar'),
            )));
  }
}
