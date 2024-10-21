import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';

class ListViewShadow extends StatelessWidget {
  const ListViewShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.white.withOpacity(0), AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
