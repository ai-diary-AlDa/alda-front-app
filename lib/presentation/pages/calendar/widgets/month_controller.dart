import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthController extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onForwardPressed;
  final void Function(DateTime) onPickerDateTimeChanged;
  final DateTime selectedYearMonth;

  const MonthController(
      {super.key,
      required this.onBackPressed,
      required this.onForwardPressed,
      required this.onPickerDateTimeChanged,
      required this.selectedYearMonth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: onBackPressed,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.black01,
          ),
        ),
        CupertinoButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 300,
                    child: CupertinoDatePicker(
                        initialDateTime: selectedYearMonth,
                        mode: CupertinoDatePickerMode.monthYear,
                        onDateTimeChanged: onPickerDateTimeChanged),
                  ),
                );
              },
            );
          },
          child: Text(DateFormat("yyyy년 MM월").format(selectedYearMonth),
              style: Theme.of(context)
                  .appTexts
                  .title
                  .copyWith(color: AppColors.black01)),
        ),
        CupertinoButton(
            onPressed: onForwardPressed,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.black01,
            ))
      ],
    );
  }
}
