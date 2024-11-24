import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.focusNode,
    this.controller,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.borderColor = const Color(0xFF007AFF),
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.placeholderStyle,
    this.onEditingComplete,
    this.onChanged,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String placeholder;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color borderColor;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextStyle? placeholderStyle;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });

    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        style: widget.textStyle,
        textAlign: widget.textAlign,
        keyboardType: widget.keyboardType,
        focusNode: focusNode,
        decoration: BoxDecoration(
          border: !focusNode.hasFocus ? Border.all(color: Colors.transparent) : Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(8),
          color: widget.backgroundColor,
        ),
        placeholder: widget.placeholder,
        placeholderStyle: widget.placeholderStyle ??
            Theme.of(context).appTexts.body.copyWith(color: AppColors.gray, fontWeight: FontWeight.normal),
        padding: EdgeInsets.all(12),
        controller: controller);
  }
}
