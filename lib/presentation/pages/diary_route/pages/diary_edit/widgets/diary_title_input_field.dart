import 'package:alda_front/presentation/common/widgets/app_text_field.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryTitleInputField extends StatefulWidget {
  const DiaryTitleInputField({
    super.key,
  });

  @override
  State<DiaryTitleInputField> createState() => _DiaryTitleInputFieldState();
}

class _DiaryTitleInputFieldState extends State<DiaryTitleInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
        text: DateFormat("yyyy년 MM월 dd일의 일기").format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onEditingComplete: () {
        if (_controller.text.isEmpty) {
          _controller.text =
              DateFormat("yyyy년 MM월 dd일의 일기").format(DateTime.now());
        }
      },
      textStyle:
          Theme.of(context).appTexts.body.copyWith(fontWeight: FontWeight.bold),
      placeholderStyle: Theme.of(context)
          .appTexts
          .body
          .copyWith(fontWeight: FontWeight.bold, color: AppColors.gray),
      placeholder: "제목을 입력해주세요",
      borderColor: Colors.transparent,
      textAlign: TextAlign.center,
      backgroundColor: Colors.transparent,
      controller: _controller,
    );
  }
}
