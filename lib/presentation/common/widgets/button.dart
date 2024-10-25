import 'package:alda_front/themes/colors.dart';
import 'package:flutter/cupertino.dart';

const EdgeInsets _kDefaultPadding = EdgeInsets.all(0);

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.pressedOpacity = 0.4})
      : backgroundColor = null,
        minSize = 0;

  const Button.filled(
      {super.key,
      required this.child,
      required this.onPressed,
      this.backgroundColor = AppColors.black02,
      this.minSize,
      this.padding,
      this.borderRadius = const BorderRadius.all(Radius.zero),
      this.pressedOpacity = 0.4});

  final Widget child;
  final void Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? minSize;
  final BorderRadius? borderRadius;
  final double pressedOpacity;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        pressedOpacity: pressedOpacity,
        borderRadius: borderRadius,
        color: backgroundColor,
        padding: padding ?? _kDefaultPadding,
        minSize: minSize ?? 0,
        onPressed: onPressed,
        child: child);
  }
}
