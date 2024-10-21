import 'package:alda_front/presentation/pages/main_route/pages/calendar/widgets/day_table.dart';
import 'package:alda_front/presentation/pages/main_route/pages/calendar/widgets/month_controller.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';

class CalendarSection extends StatefulWidget {
  const CalendarSection({
    super.key,
  });

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  late List<DateTime> _calendarPages;
  late DateTime _selectedYearMonth;
  final _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _calendarPages = [
      DateTime(today.year, today.month - 1),
      DateTime(today.year, today.month),
      DateTime(today.year, today.month + 1)
    ];
    _selectedYearMonth = _calendarPages.elementAt(1);
    _pageController.addListener(() {
      final index = _pageController.page! > 1
          ? _pageController.page!.floor()
          : _pageController.page!.ceil();

      if (index == 1) {
        return;
      }
      if (index == 0) {
        _prev();
      } else {
        _next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonthController(
            onBackPressed: () {
              _pageController.previousPage(
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            },
            onForwardPressed: () {
              _pageController.nextPage(
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            },
            onPickerDateTimeChanged: (DateTime dateTime) {
              setState(() {
                _calendarPages = [
                  DateTime(dateTime.year, dateTime.month - 1),
                  dateTime,
                  DateTime(dateTime.year, dateTime.month + 1)
                ];
                _selectedYearMonth = _calendarPages[1];
              });
            },
            selectedYearMonth: _selectedYearMonth),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ["일", "월", "화", "수", "목", "금", "토"]
                      .map((day) => SizedBox(
                          width: 45,
                          child: Center(
                              child: Text(
                            day,
                            style: Theme.of(context).appTexts.title.copyWith(
                                fontSize: 16, color: Color(0xFFBCA37E)),
                          ))))
                      .toList(),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) =>
                          DayTable(currentDate: _calendarPages[index]),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _prev() {
    setState(() {
      _calendarPages
        ..insert(0,
            DateTime(_calendarPages.first.year, _calendarPages.first.month - 1))
        ..removeLast();
      _selectedYearMonth = _calendarPages[1];
    });
    _pageController.jumpToPage(1);
  }

  void _next() {
    setState(() {
      _calendarPages
        ..removeAt(0)
        ..insert(2,
            DateTime(_calendarPages.last.year, _calendarPages.last.month + 1));
      _selectedYearMonth = _calendarPages[1];
    });
    _pageController.jumpToPage(1);
  }
}
