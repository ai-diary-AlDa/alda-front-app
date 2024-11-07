import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DiaryTopicSelectFab extends StatelessWidget {
  const DiaryTopicSelectFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 48),
      child: Container(
        width: 180,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.black02,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black01,
              offset: Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 0.1,
            )
          ],
        ),
        child: Center(
          child: Button(
            onPressed: () {
              context.tabsRouter.navigate(DiaryEditRoute());
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "주제 없이 쓰기",
                    style:
                        Theme.of(context).appTexts.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
