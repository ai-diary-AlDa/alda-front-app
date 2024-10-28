part of 'calendar_bloc.dart';

final class CalendarState extends Equatable {
  final DateTime selectedYearMonth;
  final DateTime selectedDate;
  final DateTime today;
  final List<DateTime> calendarPages;

  const CalendarState(
      {required this.selectedYearMonth,
      required this.selectedDate,
      required this.today,
      required this.calendarPages});

  CalendarState copyWith(
      {DateTime? selectedYearMonth,
      DateTime? selectedDate,
      DateTime? today,
      List<DateTime>? calendarPages}) {
    return CalendarState(
        selectedYearMonth: selectedYearMonth ?? this.selectedYearMonth,
        selectedDate: selectedDate ?? this.selectedDate,
        today: today ?? this.today,
        calendarPages: calendarPages ?? this.calendarPages);
  }

  @override
  List<Object?> get props =>
      [selectedYearMonth, selectedDate, today, calendarPages];
}
