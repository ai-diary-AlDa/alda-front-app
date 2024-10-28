part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {}

class SelectedYearMonthChanged extends CalendarEvent {
  final DateTime selectedYearMonth;

  SelectedYearMonthChanged(this.selectedYearMonth);

  @override
  List<Object?> get props => [selectedYearMonth];
}

class SelectedDateChanged extends CalendarEvent {
  final DateTime selectedDate;

  SelectedDateChanged(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];
}
