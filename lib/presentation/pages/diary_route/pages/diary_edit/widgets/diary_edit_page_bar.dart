import 'dart:async';

import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_title_input_field.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/sparkles_loading_indicator.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pull_down_button/pull_down_button.dart';

class DiaryEditPageBar extends StatelessWidget {
  const DiaryEditPageBar({
    super.key,
    required this.onPressedBack,
  });

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
                      listenWhen: (previous, current) =>
                          previous.feedbackState != current.feedbackState &&
                              current.feedbackState is LoadedDiaryFeedbackState ||
                          current.feedbackState is ErrorDiaryFeedbackState,
                      listener: (context, state) {
                        Navigator.pop(context);
                        if (state.feedbackState is LoadedDiaryFeedbackState) {
                          context.read<DiaryEditBloc>().add(ToggleFeedbackViewEvent());
                        } else if (state.feedbackState is ErrorDiaryFeedbackState) {
                          Fluttertoast.showToast(msg: '피드백 생성에 실패했어요. 다시 시도해주세요.');
                        }
                      },
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) => PullDownButton(
                            itemBuilder: (context) => [
                              PullDownMenuItem(
                                title: '피드백 생성하기',
                                enabled: state.canFeedback,
                                onTap: () => _onGenerateFeedbackButtonPressed(context),
                                icon: CupertinoIcons.ellipses_bubble,
                              ),
                              PullDownMenuItem(
                                title: state.feedbackView ? '일기 수정하기' : '피드백 보기',
                                subtitle: () {
                                  if (state.feedbackView) {
                                    return null;
                                  }

                                  if (state.feedbackState.feedbacks != null &&
                                      state.feedbackState.feedbacks!.isNotEmpty) {
                                    return '생성한 피드백을 확인할 수 있어요.';
                                  }

                                  return '먼저 피드백을 생성해주세요.';
                                }(),
                                enabled:
                                    state.feedbackState.feedbacks != null && state.feedbackState.feedbacks!.isNotEmpty,
                                onTap: () {
                                  context.read<DiaryEditBloc>().add(ToggleFeedbackViewEvent());
                                },
                                icon: state.feedbackView
                                    ? CupertinoIcons.pencil
                                    : CupertinoIcons.bubble_left_bubble_right,
                              ),
                            ],
                            buttonBuilder: (context, showMenu) => Button(
                              onPressed: showMenu,
                              child: HeroIcon(
                                HeroIcons.sparkles,
                                color: AppColors.black02,
                                style: HeroIconStyle.solid,
                              ),
                            ),
                          )),
                  SizedBox(
                    width: 12,
                  ),
                  Button(
                    onPressed: () {
                      context.read<DiaryEditBloc>().add(SaveDiaryEvent());
                    },
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
          SizedBox(
              width: 250,
              child: DiaryTitleInputField(
                initialTitle: context.read<DiaryEditBloc>().state.diaryTitle,
                onChanged: (value) => context.read<DiaryEditBloc>().add(DiaryTitleChangedEvent(value)),
              )),
        ],
      ),
    );
  }

  void _onGenerateFeedbackButtonPressed(BuildContext context) {
    _showFeedbackLoadingIndicator(context);
    _emitLoadDiaryFeedbackEvent(context);
  }

  void _emitLoadDiaryFeedbackEvent(BuildContext context) {
    context.read<DiaryEditBloc>().add(LoadDiaryFeedbackEvent());
  }

  Future<void> _showFeedbackLoadingIndicator(BuildContext context) {
    return showDialog(
        useSafeArea: false, barrierDismissible: false, context: context, builder: (_) => SparklesLoadingIndicator());
  }
}
