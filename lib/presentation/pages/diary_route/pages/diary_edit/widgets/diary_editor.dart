import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility_temp_fork/flutter_keyboard_visibility_temp_fork.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
        child: KeyboardVisibilityBuilder(
          builder: (innerContext, isKeyboardVisible) => QuillEditor.basic(
            scrollController: scrollController,
            controller: editorController,
            configurations: QuillEditorConfigurations(
                scrollBottomInset: 70,
                padding: EdgeInsets.fromLTRB(
                    0,
                    10,
                    0,
                    MediaQuery.of(context).size.height *
                        (isKeyboardVisible ? 0.1 : 0.4)),
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
      ),
    );
  }
}
