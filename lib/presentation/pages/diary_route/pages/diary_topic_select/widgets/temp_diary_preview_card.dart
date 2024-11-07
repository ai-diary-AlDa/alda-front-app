import 'dart:math';

import 'package:alda_front/domain/model/temp_diary.dart';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TempDiaryPreviewCard extends StatelessWidget {
  TempDiaryPreviewCard({
    super.key,
    required this.tempDiary,
  });

  final TempDiary tempDiary;

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
      child: Button(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${DateFormat("yyyy년 MM월 dd일").format(tempDiary.entryDate)}의 일기",
                style: Theme.of(context).appTexts.label,
              ),
              SizedBox(height: 6),
              Text(
                tempDiary.title,
                style: Theme.of(context).appTexts.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                tempDiary.contents,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).appTexts.body,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "최종 수정 일시: ${DateFormat("yyyy년 MM월 dd일 HH:mm").format(tempDiary.updatedAt)}",
                    style: Theme.of(context).appTexts.label.copyWith(color: AppColors.gray),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
