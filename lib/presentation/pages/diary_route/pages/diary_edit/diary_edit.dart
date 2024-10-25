import 'dart:developer';

import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility_temp_fork/flutter_keyboard_visibility_temp_fork.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';

final kToggleButtonOptions = QuillToolbarToggleStyleButtonOptions(
    iconTheme: QuillIconTheme(
        iconButtonSelectedData: IconButtonData(
            style: IconButton.styleFrom(backgroundColor: AppColors.black02))));

@RoutePage()
class DiaryEditPage extends StatefulWidget {
  const DiaryEditPage({super.key});

  @override
  State<DiaryEditPage> createState() => _DiaryEditPageState();
}

class _DiaryEditPageState extends State<DiaryEditPage> {
  final _controller = QuillController.basic();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.document.changes.listen(
      (event) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: DiaryEditorToolbar(controller: _controller),
      backgroundColor: AppColors.beige,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DiaryEditPageBar(
                onPressedSave: () {
                  log(_controller.document.toDelta().toJson().toString());
                  Fluttertoast.showToast(
                    msg: '일기를 저장했어요.',
                    timeInSecForIosWeb: 2,
                    gravity: ToastGravity.BOTTOM, // Position at bottom
                    backgroundColor: AppColors.black02,
                    textColor: Colors.white,
                  );
                },
                onPressedFeedback: () {},
                onPressedBack: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        children: [
                                          Container(
                                            color: AppColors.black02,
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "지금 돌아가면 수정한 내용이 사라져요.",
                                                style: Theme.of(context)
                                                    .appTexts
                                                    .body
                                                    .copyWith(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 0.1,
                                            thickness: 0.1,
                                            color: AppColors.lightGray,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            color: AppColors.white,
                                            child: Button.filled(
                                              pressedOpacity: 0.9,
                                              onPressed: () {
                                                Navigator.pop(context);
                                                backToTopicSelect();
                                              },
                                              child: Text(
                                                "삭제",
                                                style: Theme.of(context)
                                                    .appTexts
                                                    .body
                                                    .copyWith(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 0.1,
                                            thickness: 0.1,
                                            color: AppColors.lightGray,
                                          ),
                                          Container(
                                            color: AppColors.white,
                                            width: double.infinity,
                                            height: 50,
                                            child: Button.filled(
                                              pressedOpacity: 0.9,
                                              onPressed: () {},
                                              child: Text(
                                                "저장하고 나가기",
                                                style: Theme.of(context)
                                                    .appTexts
                                                    .body
                                                    .copyWith(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      width: double.infinity,
                                      height: 50,
                                      child: Button.filled(
                                        pressedOpacity: 0.9,
                                        borderRadius: BorderRadius.circular(16),
                                        onPressed: () {},
                                        child: Text(
                                          "취소",
                                          style: Theme.of(context)
                                              .appTexts
                                              .body
                                              .copyWith(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ));
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  "${DateTime.now().day}",
                                  style: Theme.of(context)
                                      .appTexts
                                      .heading
                                      .copyWith(fontSize: 48),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "August",
                                  style: Theme.of(context).appTexts.body,
                                )
                              ],
                            ),
                            Text(
                              "😭",
                              style: TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                      ),
                    ),
                    DiaryEditor(
                      editorController: _controller,
                      scrollController: _scrollController,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void backToTopicSelect() {
    context.tabsRouter.navigate(DiaryTopicSelectRoute());
  }
}

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Button(
          onPressed: onPressedBack,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black01,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
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
                      fontWeight: FontWeight.bold, color: AppColors.black01),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class DiaryEditor extends StatelessWidget {
  const DiaryEditor({
    super.key,
    required this.editorController,
    required this.scrollController,
  });

  final QuillController editorController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: QuillEditor.basic(
          scrollController: scrollController,
          controller: editorController,
          configurations: QuillEditorConfigurations(
              padding: EdgeInsets.fromLTRB(
                  0, 10, 0, MediaQuery.of(context).size.height * 0.4),
              placeholder: "일기를 써보세요.",
              customStyles: DefaultStyles(
                placeHolder: DefaultTextBlockStyle(
                    Theme.of(context)
                        .appTexts
                        .body
                        .copyWith(color: Colors.grey.shade500),
                    HorizontalSpacing(15, 15),
                    VerticalSpacing(15, 15),
                    VerticalSpacing(1, 1),
                    null),
              )),
        ),
      ),
    );
  }
}

class DiaryEditorToolbar extends StatelessWidget {
  const DiaryEditorToolbar({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => Container(
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: isKeyboardVisible ? 0 : 16),
                child: QuillToolbar(
                  configurations: const QuillToolbarConfigurations(
                      buttonOptions: QuillSimpleToolbarButtonOptions(
                          base: QuillToolbarBaseButtonOptions(
                              iconSize: 15, iconButtonFactor: 1.4))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        QuillToolbarHistoryButton(
                          isUndo: true,
                          controller: _controller,
                        ),
                        QuillToolbarHistoryButton(
                          isUndo: false,
                          controller: _controller,
                        ),
                        QuillToolbarToggleStyleButton(
                          options: kToggleButtonOptions,
                          controller: _controller,
                          attribute: Attribute.bold,
                        ),
                        QuillToolbarToggleStyleButton(
                          options: kToggleButtonOptions,
                          controller: _controller,
                          attribute: Attribute.italic,
                        ),
                        QuillToolbarToggleStyleButton(
                          options: kToggleButtonOptions,
                          controller: _controller,
                          attribute: Attribute.underline,
                        ),
                        QuillToolbarToggleStyleButton(
                            options: kToggleButtonOptions,
                            controller: _controller,
                            attribute: Attribute.strikeThrough),
                        QuillToolbarToggleStyleButton(
                          options: kToggleButtonOptions,
                          controller: _controller,
                          attribute: Attribute.ul,
                        ),
                        QuillToolbarToggleStyleButton(
                          options: kToggleButtonOptions,
                          controller: _controller,
                          attribute: Attribute.ol,
                        ),
                        QuillToolbarIndentButton(
                          controller: _controller,
                          isIncrease: true,
                        ),
                        QuillToolbarIndentButton(
                          controller: _controller,
                          isIncrease: false,
                        ),
                        QuillToolbarToggleStyleButton(
                          controller: _controller,
                          attribute: Attribute.blockQuote,
                        ),
                        QuillToolbarLinkStyleButton(controller: _controller),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
