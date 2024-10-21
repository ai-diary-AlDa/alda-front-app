import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
        AutoRoute(page: MainRoute.page, path: "/main", children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: CalendarRoute.page, path: 'calendar'),
        ]),
        CustomRoute(
            page: DiaryRoute.page,
            path: '/diary',
            children: [
              AutoRoute(page: DiaryTopicSelectRoute.page, path: 'topic')
            ],
            transitionsBuilder: TransitionsBuilders.slideBottom,
            durationInMilliseconds: 300,
            reverseDurationInMilliseconds: 300)
      ];

  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500,
      );
}
