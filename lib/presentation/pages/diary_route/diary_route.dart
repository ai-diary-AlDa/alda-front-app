import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiaryRoute extends StatelessWidget {
  const DiaryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [DiaryTopicSelectRoute(), DiaryEditRoute()],
    );
  }
}
