import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: SplashRoute.page, initial: true, path: '/'),
        CustomRoute(
            page: MainRoute.page,
            path: "/main",
            children: [
              AutoRoute(page: HomeRoute.page, path: 'home'),
              AutoRoute(page: CalendarRoute.page, path: 'calendar'),
            ],
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 500),
        CustomRoute(
            page: DiaryRoute.page,
            path: '/diary',
            children: [
              CustomRoute(page: DiaryTopicSelectRoute.page, path: 'topic'),
              CustomRoute(page: DiaryEditRoute.page, path: 'edit')
            ],
            transitionsBuilder: TransitionsBuilders.slideBottom,
            durationInMilliseconds: 300,
            reverseDurationInMilliseconds: 300)
      ];
}
