import 'package:alda_front/presentation/pages/main_route/pages/home/sections/diary_list.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthIndicator extends StatelessWidget {
  const MonthIndicator({
    super.key,
    required this.diaries,
    required this.element,
  });

  final List<Diary> diaries;
  final Diary element;

  @override
  Widget build(BuildContext context) {
    int count = groupBy(diaries,
                    (diary) => DateTime(diary.date.year, diary.date.month))[
                DateTime(element.date.year, element.date.month)]
            ?.length ??
        0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('yyyy년 MM월').format(element.date),
            style: Theme.of(context).appTexts.label,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                "$count개의 일기",
                style: Theme.of(context).appTexts.label,
              ),
            ),
          )
        ],
      ),
    );
  }
}