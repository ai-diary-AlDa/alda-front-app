import 'dart:math';

import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryPreviewCard extends StatelessWidget {
  DiaryPreviewCard({
    super.key,
    required this.diary,
  });

  final Diary diary;

  final Color _backgroundColor = [
    AppColors.beige,
    AppColors.lightYellow,
    AppColors.lightGreen,
    AppColors.yellow,
    AppColors.pink,
    AppColors.skyblue,
    AppColors.lightGray
  ][Random().nextInt(7)];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd').format(diary.entryDate),
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, height: 1.4),
                ),
                Text(DateFormat.MMM().format(diary.entryDate)),
              ],
            ),
            SizedBox(
              height: 72,
              child: const VerticalDivider(
                width: 30,
                thickness: 0.5,
                color: AppColors.black01,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          diary.title,
                          style: Theme.of(context).appTexts.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        diary.primaryEmotion.emoji,
                        style: TextStyle(fontSize: 30, height: -0.3),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    diary.contents,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).appTexts.body,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
