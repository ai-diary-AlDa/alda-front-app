import 'dart:developer';

import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart';
import 'package:alda_front/themes/colors.dart';

import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility_temp_fork/flutter_keyboard_visibility_temp_fork.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:markdown_quill/markdown_quill.dart';

class DiaryEditor extends StatefulWidget {
  const DiaryEditor({
    super.key,
    required this.editorController,
    required this.scrollController,
    required this.deltaToMdConverter,
  });

  final QuillController editorController;
  final ScrollController scrollController;
  final DeltaToMarkdown deltaToMdConverter;

  @override
  State<DiaryEditor> createState() => _DiaryEditorState();
}

class _DiaryEditorState extends State<DiaryEditor> {
  late final QuillController editorController;
  late final ScrollController scrollController;
  late final DeltaToMarkdown deltaToMarkdown;

  @override
  void initState() {
    super.initState();
    editorController = widget.editorController;
    scrollController = widget.scrollController;
    deltaToMarkdown = widget.deltaToMdConverter;

    editorController.changes.listen((_) {
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        final bloc = context.read<DiaryEditBloc>();
        // final markdown = deltaToMarkdown.convert(editorController.document.toDelta());
        // bloc.add(DiaryContentsChangedEvent(markdown));
        bloc.add(DiaryContentsChangedEvent(editorController.document.toPlainText()));
      }
    });

    editorController.addListener(() => log(editorController.document.toPlainText()));
    editorController.document.insert(0,
        "오늘 하루도 컴퓨터공학과 학생으로서 정신없이 보냈어요. 아침부터 데이터 구조 수업이 있었는데, 이번 주제는 트리 구조였어요. 복잡하게 얽힌 노드와 관계들을 이해하느라 머리가 많이 아팠지만, 문제를 풀 때마다 조금씩 구조가 보이는 게 신기했어요. 수업이 끝나고는 도서관에서 조별 프로젝트를 준비했는데, 이번엔 머신러닝을 주제로 다루게 되었어요. 팀원들과 코드 설계부터 모델 훈련까지 하나씩 논의하며 하루가 금방 지나갔네요. 집에 돌아오는 길에는 취업 준비도 슬슬 해야 한다는 생각이 들어서 조금 막막했지만, 아직 갈 길이 멀다는 생각에 마음을 다잡았어요. 밤에는 과제로 파이썬 코드를 디버깅하다가 오류를 잡아내고 나니 뿌듯한 기분이 들었어요.");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: KeyboardVisibilityBuilder(
          builder: (innerContext, isKeyboardVisible) => BlocConsumer<DiaryEditBloc, DiaryEditState>(
              listenWhen: (previous, current) => previous.feedbackView != current.feedbackView,
              listener: (context, state) => editorController.readOnly = state.feedbackView,
              buildWhen: (previous, current) =>
                  previous.feedbackState != current.feedbackState || previous.feedbackView != current.feedbackView,
              builder: (context, state) {
                if (state.feedbackView) {
                  return Stack(
                    children: [
                      ..._buildFeedbackHighlights(state.feedbackState.feedbacks!),
                      _buildEditor(
                          feedbackView: state.feedbackView,
                          padding: EdgeInsets.fromLTRB(
                              0, 10, 0, MediaQuery.of(context).size.height * (isKeyboardVisible ? 0.1 : 0.4))),
                      ..._buildFeedbackButtons(state.feedbackState.feedbacks!),
                    ],
                  );
                } else {
                  return _buildEditor(
                      feedbackView: state.feedbackView,
                      padding: EdgeInsets.fromLTRB(
                          0, 10, 0, MediaQuery.of(context).size.height * (isKeyboardVisible ? 0.1 : 0.4)));
                }
              }),
        ),
      ),
    );
  }

  Widget _buildEditor({required bool feedbackView, required EdgeInsets padding}) => QuillEditor.basic(
        scrollController: scrollController,
        controller: editorController,
        configurations: QuillEditorConfigurations(
            embedBuilders: FlutterQuillEmbeds.editorBuilders(),
            showCursor: !feedbackView,
            autoFocus: true,
            scrollBottomInset: 70,
            padding: padding,
            placeholder: "일기를 써보세요.",
            customStyles: DefaultStyles(
              placeHolder: DefaultTextBlockStyle(Theme.of(context).appTexts.body.copyWith(color: Colors.grey.shade500),
                  HorizontalSpacing(15, 15), VerticalSpacing(15, 15), VerticalSpacing(1, 1), null),
            )),
      );

  List<Widget> _buildFeedbackButtons(List<DiaryFeedback> feedbacks) {
    final diaryContents = editorController.document.toPlainText().trim();
    final widgets = <Widget>[];

    for (final feedback in feedbacks) {
      final beforeTargetString = diaryContents.substring(0, feedback.startIndex);
      final untilTargetString = diaryContents.substring(0, feedback.endIndex);

      final beforePainter = TextPainter(
        text: TextSpan(text: beforeTargetString, style: DefaultStyles.getInstance(context).paragraph!.style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width - 40);
      final untilPainter = TextPainter(
        text: TextSpan(text: untilTargetString, style: DefaultStyles.getInstance(context).paragraph!.style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width - 40);

      final beforeLineMetrics = beforePainter.computeLineMetrics();
      final untilLineMetrics = untilPainter.computeLineMetrics();

      final lineDiff =
          untilLineMetrics.last.lineNumber - (beforeLineMetrics.isEmpty ? 0 : beforeLineMetrics.last.lineNumber);

      if (lineDiff == 0) {
        final top = beforeLineMetrics.isEmpty
            ? untilLineMetrics.last.baseline - untilLineMetrics.last.descent
            : beforeLineMetrics.last.baseline - beforeLineMetrics.last.descent;
        final left = beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width;
        final height = untilLineMetrics.last.height;
        final width = untilLineMetrics.last.width - (beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width);
        log(top.toString());
        widgets.add(Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            onTap: () => _onFeedbackPressed(context, feedback.feedback),
            child: Container(
              height: height,
              width: width,
              color: Colors.transparent,
            ),
          ),
        ));
      } else {
        var top = beforeLineMetrics.isEmpty
            ? untilLineMetrics.first.baseline - untilLineMetrics.first.descent
            : beforeLineMetrics.last.baseline - beforeLineMetrics.last.descent;
        var left = beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width;
        var height = untilLineMetrics.last.height;
        var width =
            MediaQuery.of(context).size.width - 40 - (beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width);
        widgets.add(Positioned(
          top: top,
          left: left,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: GestureDetector(
              onTap: () => _onFeedbackPressed(context, feedback.feedback),
              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
              ),
            ),
          ),
        ));

        widgets.addAll(List.generate(lineDiff - 1, (index) {
          final top = beforeLineMetrics.isEmpty
              ? untilLineMetrics.first.baseline -
                  untilLineMetrics.first.descent +
                  untilLineMetrics.last.height * (index + 1)
              : beforeLineMetrics.last.baseline -
                  beforeLineMetrics.last.descent +
                  beforeLineMetrics.last.height * (index + 1);
          final left = 0.0;
          final height = untilLineMetrics.last.height;
          final width = MediaQuery.of(context).size.width - 40;
          return Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              onTap: () => _onFeedbackPressed(context, feedback.feedback),
              child: Container(height: height, width: width, color: Colors.transparent),
            ),
          );
        }));

        top = untilLineMetrics.last.baseline - untilLineMetrics.last.descent;
        left = 0.0;
        height = untilLineMetrics.last.height;
        width = untilLineMetrics.last.width;
        widgets.add(Positioned(
          top: top,
          left: left,
          child: GestureDetector(
              onTap: () => _onFeedbackPressed(context, feedback.feedback),
              child: Container(height: height, width: width, color: Colors.transparent)),
        ));
      }
    }

    return widgets;
  }

  List<Widget> _buildFeedbackHighlights(List<DiaryFeedback> feedbacks) {
    final diaryContents = editorController.document.toPlainText().trim();
    final widgets = <Widget>[];

    for (final feedback in feedbacks) {
      final beforeTargetString = diaryContents.substring(0, feedback.startIndex);
      final untilTargetString = diaryContents.substring(0, feedback.endIndex);

      final beforePainter = TextPainter(
        text: TextSpan(text: beforeTargetString, style: DefaultStyles.getInstance(context).paragraph!.style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width - 40);
      final untilPainter = TextPainter(
        text: TextSpan(text: untilTargetString, style: DefaultStyles.getInstance(context).paragraph!.style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: MediaQuery.of(context).size.width - 40);

      final untilLineMetrics = untilPainter.computeLineMetrics();
      final beforeLineMetrics = beforePainter.computeLineMetrics();

      final lineDiff =
          untilLineMetrics.last.lineNumber - (beforeLineMetrics.isEmpty ? 0 : beforeLineMetrics.last.lineNumber);

      if (lineDiff == 0) {
        final top = beforeLineMetrics.isEmpty
            ? untilLineMetrics.last.baseline - untilLineMetrics.last.descent
            : beforeLineMetrics.last.baseline - beforeLineMetrics.last.descent;
        final left = beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width;
        final height = untilLineMetrics.last.height;
        final width = untilLineMetrics.last.width - (beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width);
        log(top.toString());
        widgets.add(Positioned(
          top: top,
          left: left,
          child: Container(
            height: height,
            width: width,
            color: Colors.yellow.withOpacity(0.5),
          ),
        ));
      } else {
        var top = beforeLineMetrics.isEmpty
            ? untilLineMetrics.first.baseline - untilLineMetrics.first.descent
            : beforeLineMetrics.last.baseline - beforeLineMetrics.last.descent;
        var left = beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width;
        var height = untilLineMetrics.last.height;
        var width =
            MediaQuery.of(context).size.width - 40 - (beforeLineMetrics.isEmpty ? 0.0 : beforeLineMetrics.last.width);
        widgets.add(Positioned(
          top: top,
          left: left,
          child: Container(
            height: height,
            width: width,
            color: Colors.yellow.withOpacity(0.5),
          ),
        ));

        widgets.addAll(List.generate(lineDiff - 1, (index) {
          final top = beforeLineMetrics.isEmpty
              ? untilLineMetrics.first.baseline -
                  untilLineMetrics.first.descent +
                  untilLineMetrics.last.height * (index + 1)
              : beforeLineMetrics.last.baseline -
                  beforeLineMetrics.last.descent +
                  beforeLineMetrics.last.height * (index + 1);
          final left = 0.0;
          final height = untilLineMetrics.last.height;
          final width = MediaQuery.of(context).size.width - 40;
          return Positioned(
            top: top,
            left: left,
            child: Container(
              height: height,
              width: width,
              color: Colors.yellow.withOpacity(0.5),
            ),
          );
        }));

        top = untilLineMetrics.last.baseline - untilLineMetrics.last.descent;
        left = 0.0;
        height = untilLineMetrics.last.height;
        width = untilLineMetrics.last.width;
        widgets.add(Positioned(
          top: top,
          left: left,
          child: Container(
            height: height,
            width: width,
            color: Colors.yellow.withOpacity(0.5),
          ),
        ));
      }
    }

    return widgets;
  }

  void _onFeedbackPressed(BuildContext context, String feedback) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "알다의 한마디",
                        style: Theme.of(context).appTexts.title,
                      ),
                      SizedBox(height: 8),
                      Text(feedback),
                    ],
                  ),
                ),
              ),
            ));
  }
}
