import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_edit/widgets/quill_toolbar_select_heading_buttons.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility_temp_fork/flutter_keyboard_visibility_temp_fork.dart';
import 'package:flutter_quill/flutter_quill.dart';

final kToggleButtonOptions = QuillToolbarToggleStyleButtonOptions(
    iconTheme: QuillIconTheme(
        iconButtonSelectedData: IconButtonData(
            style: IconButton.styleFrom(backgroundColor: AppColors.black02))));

class DiaryEditorToolbar extends StatelessWidget {
  const DiaryEditorToolbar({
    super.key,
    required this.editorController,
  });
  final QuillController editorController;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => isKeyboardVisible
            ? Container(
                color: AppColors.white,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    QuillToolbar(
                      configurations: const QuillToolbarConfigurations(
                          buttonOptions: QuillSimpleToolbarButtonOptions(
                              base: QuillToolbarBaseButtonOptions(
                                  iconSize: 15, iconButtonFactor: 1.4))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QuillToolbarHistoryButton(
                              isUndo: true,
                              controller: editorController,
                            ),
                            QuillToolbarHistoryButton(
                              isUndo: false,
                              controller: editorController,
                            ),
                            QuillToolbarToggleStyleButton(
                              options: kToggleButtonOptions,
                              controller: editorController,
                              attribute: Attribute.bold,
                            ),
                            QuillToolbarToggleStyleButton(
                              options: kToggleButtonOptions,
                              controller: editorController,
                              attribute: Attribute.italic,
                            ),
                            QuillToolbarToggleStyleButton(
                              options: kToggleButtonOptions,
                              controller: editorController,
                              attribute: Attribute.underline,
                            ),
                            QuillToolbarToggleStyleButton(
                                options: kToggleButtonOptions,
                                controller: editorController,
                                attribute: Attribute.strikeThrough),
                            QuillToolbarSelectHeadingButtons(
                              controller: editorController,
                            ),
                            QuillToolbarToggleStyleButton(
                              options: kToggleButtonOptions,
                              controller: editorController,
                              attribute: Attribute.ul,
                            ),
                            QuillToolbarToggleStyleButton(
                              options: kToggleButtonOptions,
                              controller: editorController,
                              attribute: Attribute.ol,
                            ),
                            QuillToolbarIndentButton(
                              controller: editorController,
                              isIncrease: true,
                            ),
                            QuillToolbarIndentButton(
                              controller: editorController,
                              isIncrease: false,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: editorController,
                              attribute: Attribute.blockQuote,
                              options: kToggleButtonOptions,
                            ),
                            QuillToolbarInsertLinkButton(
                                controller: editorController),
                            SizedBox(
                              width: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 0.2,
                              thickness: 0.2,
                              color: AppColors.black02,
                            ),
                          ),
                          Button(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.keyboard_hide_rounded,
                              color: AppColors.black02,
                            ),
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : SizedBox.shrink());
  }
}

class QuillToolbarInsertLinkButton extends StatelessWidget {
  const QuillToolbarInsertLinkButton({super.key, required this.controller});
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    final isToggled = QuillTextLink.isSelected(controller);

    return QuillToolbarIconButton(
      icon: Icon(Icons.link),
      onPressed: () => _openLinkDialog(context),
      isSelected: isToggled,
      iconTheme: kToggleButtonOptions.iconTheme,
    );
  }

  Future<void> _openLinkDialog(BuildContext context) async {
    final initialTextLink = QuillTextLink.prepare(controller);

    final textLink = await showCupertinoDialog<QuillTextLink>(
      barrierDismissible: true,
      context: context,
      builder: (_) => InsertLinkDialog(
        link: initialTextLink.link,
        text: initialTextLink.text,
      ),
    );
    if (textLink != null) {
      textLink.submit(controller);
    }
  }
}

class InsertLinkDialog extends StatefulWidget {
  const InsertLinkDialog({
    super.key,
    required this.link,
    required this.text,
  });

  final String? link;
  final String? text;

  @override
  State<InsertLinkDialog> createState() => _InsertLinkDialogState();
}

class _InsertLinkDialogState extends State<InsertLinkDialog> {
  late String _link;
  late String _text;
  late final TextEditingController _linkController;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _link = widget.link ?? '';
    _text = widget.text ?? '';
    _linkController = TextEditingController(text: _link);
    _textController = TextEditingController(text: _text);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Wrap(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('링크 추가',
                        style: Theme.of(context)
                            .appTexts
                            .title
                            .copyWith(fontSize: 20)),
                    Button(
                        child: Icon(
                          Icons.close,
                          color: AppColors.gray,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "URL",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: _linkController,
                      placeholder: 'URL',
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("대체 텍스트"),
                    SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: _textController,
                      placeholder: '텍스트',
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button.filled(
                      borderRadius: BorderRadius.circular(8),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      onPressed: () {
                        Navigator.of(context).pop(QuillTextLink(
                            _textController.text, _linkController.text));
                      },
                      child: Text(
                        '추가',
                        style: Theme.of(context).appTexts.body.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.focusNode,
    this.controller,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.borderColor = const Color(0xFF007AFF),
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.placeholderStyle,
    this.onEditingComplete,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String placeholder;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color borderColor;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextStyle? placeholderStyle;
  final void Function()? onEditingComplete;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });

    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        onEditingComplete: widget.onEditingComplete,
        style: widget.textStyle,
        textAlign: widget.textAlign,
        keyboardType: widget.keyboardType,
        focusNode: focusNode,
        decoration: BoxDecoration(
          border: !focusNode.hasFocus
              ? Border.all(color: Colors.transparent)
              : Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(8),
          color: widget.backgroundColor,
        ),
        placeholder: widget.placeholder,
        placeholderStyle: widget.placeholderStyle ??
            Theme.of(context)
                .appTexts
                .body
                .copyWith(color: AppColors.gray, fontWeight: FontWeight.normal),
        padding: EdgeInsets.all(12),
        controller: controller);
  }
}
