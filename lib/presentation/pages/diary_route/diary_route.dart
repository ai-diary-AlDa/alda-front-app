import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiaryRoute extends StatelessWidget {
  const DiaryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [DiaryTopicSelectRoute(), DiaryEditRoute()],
      duration: Durations.long1,
      transitionBuilder: (context, child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(context.tabsRouter.activeIndex == 0 ? -1 : 1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      builder: (context, child) => Scaffold(
        body: child,
        backgroundColor: AppColors.beige,
      ),
    );
  }
}
