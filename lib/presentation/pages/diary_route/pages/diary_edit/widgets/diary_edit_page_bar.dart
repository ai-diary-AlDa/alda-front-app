import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_editor_toolbar.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

class DiaryEditPageBar extends StatelessWidget {
  const DiaryEditPageBar({
    super.key,
    required this.onPressedSave,
    required this.onPressedFeedback,
    required this.onPressedBack,
  });

  final VoidCallback onPressedSave;
  final VoidCallback onPressedFeedback;
  final VoidCallback onPressedBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                onPressed: onPressedBack,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.black01,
                ),
              ),
              Row(
                children: [
                  Button(
                    onPressed: onPressedFeedback,
                    child: HeroIcon(
                      HeroIcons.sparkles,
                      style: HeroIconStyle.solid,
                      color: AppColors.black01,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Button(
                    onPressed: onPressedSave,
                    child: Text(
                      "저장",
                      style: Theme.of(context).appTexts.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.black01),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(width: 250, child: DiaryTitleInputField()),
        ],
      ),
    );
  }
}

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
