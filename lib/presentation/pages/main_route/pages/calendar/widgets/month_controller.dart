import 'package:alda_front/presentation/pages/main_route/pages/calendar/bloc/calendar_bloc.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MonthController extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onForwardPressed;

  const MonthController(
      {super.key, required this.onBackPressed, required this.onForwardPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.all(0),
          onPressed: onBackPressed,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.black01,
          ),
        ),
        BlocBuilder<CalendarBloc, CalendarState>(
          buildWhen: (previous, current) =>
              previous.selectedYearMonth != current.selectedYearMonth,
          builder: (context, state) => CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                barrierDismissible: true,
                builder: (innerContext) => Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 300,
                    child: CupertinoDatePicker(
                        initialDateTime: state.selectedYearMonth,
                        mode: CupertinoDatePickerMode.monthYear,
                        onDateTimeChanged: (dateTime) {
                          context
                              .read<CalendarBloc>()
                              .add(SelectedYearMonthChanged(dateTime));
                        }),
                  ),
                ),
              );
            },
            child: Text(DateFormat("yyyy년 MM월").format(state.selectedYearMonth),
                style: Theme.of(context)
                    .appTexts
                    .title
                    .copyWith(color: AppColors.black01)),
          ),
        ),
        CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: onForwardPressed,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.black01,
            ))
      ],
    );
  }
}
