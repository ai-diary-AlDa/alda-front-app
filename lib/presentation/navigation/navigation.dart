import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: CalendarRoute.page, path: 'calendar'),
        ]),
        CustomRoute(
            page: DiaryTopicSelectRoute.page,
            path: '/diary-topic-select',
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 300)
      ];
}
