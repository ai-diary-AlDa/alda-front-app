import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  final TextStyle heading;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  const AppTextsTheme._internal({
    required this.heading,
    required this.title,
    required this.body,
    required this.label,
  });

  factory AppTextsTheme.main() {
    return const AppTextsTheme._internal(
      heading: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'YUniverse'),
      title: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black01),
      body: TextStyle(fontSize: 16, color: AppColors.black01),
      label: TextStyle(fontSize: 14, color: AppColors.black01),
    );
  }

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme._internal(
      title: title,
      body: body,
      label: label,
      heading: heading,
    );
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
          covariant ThemeExtension<AppTextsTheme>? other, double t) =>
      this;
}
