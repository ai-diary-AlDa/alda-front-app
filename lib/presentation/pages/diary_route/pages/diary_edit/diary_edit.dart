import 'dart:developer';

import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_edit_page_bar.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_editor.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_editor_toolbar.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DiaryEditPage extends StatefulWidget {
  const DiaryEditPage({super.key});

  @override
  State<DiaryEditPage> createState() => _DiaryEditPageState();
}

class _DiaryEditPageState extends State<DiaryEditPage> {
  final _editorController = QuillController.basic();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _editorController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: DiaryEditorToolbar(
        editorController: _editorController,
      ),
      backgroundColor: AppColors.beige,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DiaryEditPageBar(
                onPressedSave: () {
                  log(_editorController.document.toDelta().toJson().toString());
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
                  _showBackConfirmModal(context);
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
                                  DateFormat("MMMM").format(DateTime.now()),
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
                      editorController: _editorController,
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

  Future<dynamic> _showBackConfirmModal(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (innerContext) => Wrap(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
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
                                          fontWeight: FontWeight.bold),
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
                                          fontWeight: FontWeight.bold),
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
                                          fontWeight: FontWeight.bold),
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
                            borderRadius: BorderRadius.circular(16)),
                        width: double.infinity,
                        height: 50,
                        child: Button.filled(
                          pressedOpacity: 0.9,
                          borderRadius: BorderRadius.circular(16),
                          onPressed: () {},
                          child: Text(
                            "취소",
                            style: Theme.of(context).appTexts.body.copyWith(
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
  }

  void backToTopicSelect() {
    context.tabsRouter.navigate(DiaryTopicSelectRoute());
  }
}
