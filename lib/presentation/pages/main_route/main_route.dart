import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/presentation/pages/home/widgets/navigation_fab.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        CalendarRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              child,
              ['home', 'calendar'].contains(tabsRouter.currentChild?.path)
                  ? NavigationFAB()
                  : SizedBox.shrink()
            ],
          ),
        );
      },
    );
  }
}
