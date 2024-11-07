import 'dart:async';

import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_title_input_field.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/sparkles_loading_indicator.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';

class DiaryEditPageBar extends StatelessWidget {
  const DiaryEditPageBar({
    super.key,
    required this.onPressedSave,
    required this.onPressedBack,
  });

  final VoidCallback onPressedSave;
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
                  BlocConsumer<DiaryEditBloc, DiaryEditState>(
                      listenWhen: (previous, current) => previous.feedbackState != current.feedbackState,
                      listener: (context, state) {
                        if (state.feedbackState is LoadedDiaryFeedbackState ||
                            state.feedbackState is ErrorDiaryFeedbackState) {
                          Navigator.pop(context);
                        }
                      },
                      buildWhen: (previous, current) => previous.canFeedback != current.canFeedback,
                      builder: (context, state) {
                        return Button(
                          onPressed: state.canFeedback ? () => _onFeedbackButtonPressed(context) : null,
                          child: HeroIcon(
                            HeroIcons.sparkles,
                            style: HeroIconStyle.solid,
                            color: state.canFeedback ? AppColors.black01 : AppColors.gray,
                          ),
                        );
                      }),
                  SizedBox(
                    width: 12,
                  ),
                  Button(
                    onPressed: onPressedSave,
                    child: Text(
                      "저장",
                      style: Theme.of(context)
                          .appTexts
                          .body
                          .copyWith(fontWeight: FontWeight.bold, color: AppColors.black01),
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

  void _onFeedbackButtonPressed(BuildContext context) {
    _showFeedbackLoadingIndicator(context);
    _emitLoadDiaryFeedbackEvent(context);
  }

  void _emitLoadDiaryFeedbackEvent(BuildContext context) {
    context.read<DiaryEditBloc>().add(LoadDiaryFeedbackEvent());
  }

  Future<void> _showFeedbackLoadingIndicator(BuildContext context) {
    return showDialog(
        useSafeArea: false,
        barrierDismissible: false,
        context: context,
        builder: (innerContext) => SparklesLoadingIndicator());
  }
}
