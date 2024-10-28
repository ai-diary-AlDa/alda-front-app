import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'calendar_state.dart';
part 'calendar_event.dart';

@injectable
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  static final DateTime _now = DateTime.now();

  CalendarBloc()
      : super(CalendarState(
            selectedYearMonth: DateTime(_now.year, _now.month),
            selectedDate: DateTime(_now.year, _now.month, _now.day),
            today: DateTime(_now.year, _now.month, _now.day),
            calendarPages: [
              DateTime(_now.year, _now.month - 1),
              DateTime(_now.year, _now.month),
              DateTime(_now.year, _now.month + 1)
            ])) {
    on<SelectedYearMonthChanged>(_onSelectedYearMonthChanged);
    on<SelectedDateChanged>(_onSelectedDateChanged);
  }

  void _onSelectedYearMonthChanged(
      SelectedYearMonthChanged event, Emitter<CalendarState> emit) {
    final selectedYearMonth = event.selectedYearMonth;
    final calendarPages = [
      DateTime(selectedYearMonth.year, selectedYearMonth.month - 1),
      selectedYearMonth,
      DateTime(selectedYearMonth.year, selectedYearMonth.month + 1)
    ];
    emit(state.copyWith(
        selectedYearMonth: event.selectedYearMonth,
        calendarPages: calendarPages));
  }

  void _onSelectedDateChanged(
      SelectedDateChanged event, Emitter<CalendarState> emit) {
    final selectedDate = event.selectedDate;
    emit(state.copyWith(selectedDate: selectedDate));
  }
}
