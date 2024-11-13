// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alda_front/presentation/pages/diary_route/diary_route.dart'
    as _i4;
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/diary_edit.dart'
    as _i3;
import 'package:alda_front/presentation/pages/diary_route/pages/diary_topic_select/diary_topic_select.dart'
    as _i5;
import 'package:alda_front/presentation/pages/main_route/main_route.dart'
    as _i7;
import 'package:alda_front/presentation/pages/main_route/pages/calendar/calendar.dart'
    as _i1;
import 'package:alda_front/presentation/pages/main_route/pages/diary_details/diary_details.dart'
    as _i2;
import 'package:alda_front/presentation/pages/main_route/pages/home/home.dart'
    as _i6;
import 'package:alda_front/presentation/pages/splash/splash.dart' as _i8;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i9.PageRouteInfo<void> {
  const CalendarRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarPage();
    },
  );
}

/// generated route for
/// [_i2.DiaryDetailsPage]
class DiaryDetailsRoute extends _i9.PageRouteInfo<DiaryDetailsRouteArgs> {
  DiaryDetailsRoute({
    _i10.Key? key,
    required String diaryId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          DiaryDetailsRoute.name,
          args: DiaryDetailsRouteArgs(
            key: key,
            diaryId: diaryId,
          ),
          initialChildren: children,
        );

  static const String name = 'DiaryDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DiaryDetailsRouteArgs>();
      return _i2.DiaryDetailsPage(
        key: args.key,
        diaryId: args.diaryId,
      );
    },
  );
}

class DiaryDetailsRouteArgs {
  const DiaryDetailsRouteArgs({
    this.key,
    required this.diaryId,
  });

  final _i10.Key? key;

  final String diaryId;

  @override
  String toString() {
    return 'DiaryDetailsRouteArgs{key: $key, diaryId: $diaryId}';
  }
}

/// generated route for
/// [_i3.DiaryEditPage]
class DiaryEditRoute extends _i9.PageRouteInfo<void> {
  const DiaryEditRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiaryEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryEditRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.DiaryEditPage();
    },
  );
}

/// generated route for
/// [_i4.DiaryRoute]
class DiaryRoute extends _i9.PageRouteInfo<void> {
  const DiaryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.DiaryRoute();
    },
  );
}

/// generated route for
/// [_i5.DiaryTopicSelectPage]
class DiaryTopicSelectRoute extends _i9.PageRouteInfo<void> {
  const DiaryTopicSelectRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiaryTopicSelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryTopicSelectRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.DiaryTopicSelectPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.MainRoute]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainRoute();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}
