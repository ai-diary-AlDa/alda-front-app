import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiaryTopicSelectPage extends StatelessWidget {
  const DiaryTopicSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.close,
                              color: AppColors.black01,
                              size: 28,
                            ),
                            onPressed: () {
                              context.router.back();
                            }),
                      ],
                    ),
                  ],
                )),
            Padding(
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
                  child: CupertinoButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "주제 없이 쓰기",
                          style: Theme.of(context).appTexts.body.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
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
          ],
        ),
      ),
    );
  }
}
