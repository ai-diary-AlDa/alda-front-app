import 'dart:math';

import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
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
    return Button(
      onPressed: () {
        context.router.push(DiaryDetailsRoute(diaryId: diary.id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 44,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('dd').format(diary.entryDate),
                      style: Theme.of(context).appTexts.title.copyWith(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10),
                    Text(DateFormat.MMM().format(diary.entryDate),
                        style: Theme.of(context).appTexts.body.copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
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
                          diary.analysis!.primaryEmotion.emoji,
                          style: TextStyle(fontSize: 30, height: 0.9),
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
      ),
    );
  }
}
