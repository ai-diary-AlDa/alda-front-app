import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  static const _defaultFamily = 'Pretendard';

  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  const AppTextsTheme._internal({
    required this.title,
    required this.body,
    required this.label,
  });

  factory AppTextsTheme.main() {
    return const AppTextsTheme._internal(
      title: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'NMFClassic'),
      body: TextStyle(fontSize: 16, fontFamily: _defaultFamily),
      label: TextStyle(
          fontSize: 14, fontFamily: _defaultFamily, color: AppColors.black02),
    );
  }

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme._internal(
      title: title,
      body: body,
      label: label,
    );
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
          covariant ThemeExtension<AppTextsTheme>? other, double t) =>
      this;
}
