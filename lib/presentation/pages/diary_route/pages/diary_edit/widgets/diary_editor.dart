import 'dart:async';
import 'dart:developer';

import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart';

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
        final markdown = deltaToMarkdown.convert(editorController.document.toDelta());
        bloc.add(DiaryContentsChangedEvent(markdown));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: KeyboardVisibilityBuilder(
          builder: (innerContext, isKeyboardVisible) => GestureDetector(
            onTap: () => Timer(Duration(seconds: 1), () => editorController.editorFocusNode?.requestFocus()),
            child: QuillEditor.basic(
              scrollController: scrollController,
              controller: editorController,
              configurations: QuillEditorConfigurations(
                  embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                  autoFocus: true,
                  scrollBottomInset: 70,
                  padding: EdgeInsets.fromLTRB(
                      0, 10, 0, MediaQuery.of(context).size.height * (isKeyboardVisible ? 0.1 : 0.4)),
                  placeholder: "일기를 써보세요.",
                  customStyles: DefaultStyles(
                    placeHolder: DefaultTextBlockStyle(
                        Theme.of(context).appTexts.body.copyWith(color: Colors.grey.shade500),
                        HorizontalSpacing(15, 15),
                        VerticalSpacing(15, 15),
                        VerticalSpacing(1, 1),
                        null),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
