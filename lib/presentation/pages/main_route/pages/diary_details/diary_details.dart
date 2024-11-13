import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/emotion.dart';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:intl/intl.dart';
import 'package:markdown_quill/markdown_quill.dart';
import 'package:markdown/markdown.dart' as md;

@RoutePage()
class DiaryDetailsPage extends StatefulWidget {
  const DiaryDetailsPage({super.key, required this.diaryId});

  final String diaryId;

  @override
  State<DiaryDetailsPage> createState() => _DiaryDetailsPageState();
}

class _DiaryDetailsPageState extends State<DiaryDetailsPage> {
  late final QuillController _editorController;
  late final ScrollController _scrollController;
  late final MarkdownToDelta _mdToDeltaConverter;
  late final Document _document;

  final diary = Diary(
      id: "1", entryDate: DateTime.now(), contents: "다이어리내용입니다.", title: "다이어리입니당.", primaryEmotion: Emotion.happy);

  @override
  void initState() {
    _mdToDeltaConverter = MarkdownToDelta(markdownDocument: md.Document(encodeHtml: false));
    _document = Document.fromDelta(_mdToDeltaConverter.convert(diary.contents));
    _editorController = QuillController(
        selection: TextSelection(baseOffset: 0, extentOffset: 0),
        document: _document,
        configurations: QuillControllerConfigurations());
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DiaryDetailsPageBar(diaryTitle: diary.title),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
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
                                  style: Theme.of(context).appTexts.heading.copyWith(fontSize: 48),
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
                              diary.primaryEmotion.emoji,
                              style: TextStyle(fontSize: 36, height: 0.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        controller: _scrollController,
                        child: QuillEditor.basic(
                          scrollController: _scrollController,
                          controller: _editorController,
                          configurations: QuillEditorConfigurations(
                              embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                              showCursor: false,
                              padding: EdgeInsets.fromLTRB(0, 10, 0, MediaQuery.of(context).size.height * 0.4)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiaryDetailsPageBar extends StatelessWidget {
  const DiaryDetailsPageBar({
    super.key,
    required this.diaryTitle,
  });

  final String diaryTitle;

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
                onPressed: () {
                  context.router.maybePop();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.black01,
                ),
              ),
            ],
          ),
          SizedBox(
              child: Text(
            diaryTitle,
            style: Theme.of(context).appTexts.body.copyWith(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
