import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color textPrimary;

  const AppColorsTheme._internal({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.textPrimary,
  });

  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
      backgroundPrimary: AppColors.white,
      backgroundSecondary: AppColors.beige,
      textPrimary: AppColors.black01,
    );
  }

  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      backgroundPrimary: AppColors.black01,
      backgroundSecondary: AppColors.black02,
      textPrimary: AppColors.white,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.light();
    }
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black01 = Color(0xFF090909);
  static const Color black02 = Color(0xFF2E2E2E);
  static const Color beige = Color(0xFFF4EEE3);
  static const Color lightYellow = Color(0xFFFAF4E8);
  static const Color lightGreen = Color(0xFFD5F6EA);
  static const Color yellow = Color(0xFFFFEDD4);
  static const Color pink = Color(0xFFFFD7D7);
  static const Color skyblue = Color(0xFFF6EBFB);
  static const Color lightGray = Color(0xFFE5E5E5);
}
