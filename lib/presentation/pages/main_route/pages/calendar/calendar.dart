import 'package:alda_front/presentation/pages/main_route/pages/calendar/sections/day_details_bottom_sheet.dart';
import 'package:alda_front/presentation/pages/main_route/pages/calendar/sections/calendar_section.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
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
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "달력으로 보기",
                        style: Theme.of(context).appTexts.heading,
                      ),
                      CalendarSection()
                    ],
                  ),
                ),
                DayDetailsBottomSheet()
              ],
            )));
  }
}
