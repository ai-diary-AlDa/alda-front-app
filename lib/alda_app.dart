import 'package:alda_front/presentation/navigation/navigation.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class AlDaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  AlDaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: ThemeData(fontFamily: 'Pretendard').copyWith(
        splashFactory: NoSplash.splashFactory,
        extensions: [
          AppColorsTheme.light(),
          AppTextsTheme.main(),
          PullDownButtonTheme(
              routeTheme: PullDownMenuRouteTheme(backgroundColor: AppColors.white),
              itemTheme: PullDownMenuItemTheme(
                  textStyle: AppTextsTheme.main().body, subtitleStyle: AppTextsTheme.main().label))
        ],
      ),
    );
  }
}
