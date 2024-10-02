import 'package:alda_front/presentation/navigation/navigation.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/text.dart';
import 'package:flutter/material.dart';

class AlDaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  AlDaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light(),
          AppTextsTheme.main(),
        ],
      ),
    );
  }
}
