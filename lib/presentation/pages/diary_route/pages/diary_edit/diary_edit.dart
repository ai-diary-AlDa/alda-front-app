import 'dart:async';
import 'dart:developer';

import 'package:alda_front/injectable/configurations.dart';
import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/back_confirm_bottom_modal.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_edit_page_bar.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_editor.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/diary_editor_toolbar.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:markdown_quill/markdown_quill.dart';

@RoutePage()
class DiaryEditPage extends StatefulWidget {
  const DiaryEditPage({super.key});

  @override
  State<DiaryEditPage> createState() => _DiaryEditPageState();
}

class _DiaryEditPageState extends State<DiaryEditPage> {
  final _editorController = QuillController.basic();
  final _scrollController = ScrollController();
  final _deltaToMdConverter = DeltaToMarkdown();

  @override
  void dispose() {
    _editorController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DiaryEditBloc>(),
      child: Scaffold(
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
                    log(_deltaToMdConverter
                        .convert(_editorController.document.toDelta()));

                    Fluttertoast.showToast(
                      msg: '일기를 저장했어요.',
                      timeInSecForIosWeb: 2,
                      gravity: ToastGravity.BOTTOM, // Position at bottom
                      backgroundColor: AppColors.black02,
                      textColor: Colors.white,
                    );
                  },
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
      ),
    );
  }

  Future<dynamic> _showBackConfirmModal(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (innerContext) => BackConfirmBottomModal(
            onDeletePressed: backToTopicSelect,
            onTempSavePressed: () {},
            onCancelPressed: () {
              Navigator.pop(context);
            }));
  }

  void backToTopicSelect() {
    context.tabsRouter.navigate(DiaryTopicSelectRoute());
  }
}
