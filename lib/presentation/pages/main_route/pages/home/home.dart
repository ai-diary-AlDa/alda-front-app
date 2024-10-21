import 'package:alda_front/presentation/pages/main_route/pages/home/sections/diary_list.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/sections/greetings.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/sections/header.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Greetings(),
                ),
                DiaryList()
              ],
            ),
          ),
        ));
  }
}
