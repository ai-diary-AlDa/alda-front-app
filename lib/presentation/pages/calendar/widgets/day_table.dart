import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DayTable extends StatelessWidget {
  final DateTime currentDate;

  const DayTable({super.key, required this.currentDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _generateCalendar(currentDate: currentDate)
          .map((week) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: week
                    .map((day) => Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: day.month == currentDate.month
                                  ? AppColors.beige
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9999)),
                              border:
                                  Border.all(color: AppColors.beige, width: 2)),
                          child: Center(
                              child: day.month == currentDate.month
                                  ? (day.day % 3 == 0
                                      ? Text(
                                          "${day.day}",
                                          style: Theme.of(context)
                                              .appTexts
                                              .label
                                              .copyWith(
                                                  color: Color(0xFFBCA37E),
                                                  fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          "😀",
                                          style: TextStyle(
                                              fontSize: 32, height: -0.03),
                                        ))
                                  : null),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }

  List<List<DateTime>> _generateCalendar(
      {required DateTime currentDate, bool isSundayStart = true}) {
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0);

    int firstWeekDayOfMonth = firstDayOfMonth.weekday;
    int lastWeekDayOfMonth = lastDayOfMonth.weekday;

    int remainDaysOfFirstWeek =
        isSundayStart ? firstWeekDayOfMonth % 7 : firstWeekDayOfMonth - 1;
    int remainDaysOfLastWeek = 7 -
        (isSundayStart ? ((lastWeekDayOfMonth % 7) + 1) : lastWeekDayOfMonth);

    List<DateTime> allDaysInCalendarMonth = List.generate(
            remainDaysOfFirstWeek,
            (i) => firstDayOfMonth
                .subtract(Duration(days: remainDaysOfFirstWeek - i))) +
        List.generate(
            lastDayOfMonth.day, (i) => firstDayOfMonth.add(Duration(days: i))) +
        List.generate(remainDaysOfLastWeek,
            (i) => lastDayOfMonth.add(Duration(days: i + 1)));

    allDaysInCalendarMonth += List.generate(
        (42 - allDaysInCalendarMonth.length),
        (i) => allDaysInCalendarMonth.last.add(Duration(days: i + 1)));

    return allDaysInCalendarMonth.slices(7).toList();
  }
}
