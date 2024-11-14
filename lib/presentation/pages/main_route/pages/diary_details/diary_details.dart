import 'package:alda_front/injectable/configurations.dart';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/main_route/pages/diary_details/bloc/diary_details_bloc.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:intl/intl.dart';
import 'package:markdown_quill/markdown_quill.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:skeletonizer/skeletonizer.dart';

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

  @override
  void initState() {
    _mdToDeltaConverter = MarkdownToDelta(markdownDocument: md.Document(encodeHtml: false));
    _editorController = QuillController.basic();
    _editorController.readOnly = true;
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
          child: BlocProvider(
            create: (context) => getIt<DiaryDetailsBloc>()..add(LoadDiaryDetailsEvent(widget.diaryId)),
            child: BlocConsumer<DiaryDetailsBloc, DiaryDetailsState>(
                listenWhen: (previous, current) => current.diaryDetailsDataState is LoadedDiaryDetailsState,
                listener: (context, state) {
                  if (state.diaryDetailsDataState is LoadedDiaryDetailsState) {
                    _editorController.document = Document.fromDelta(
                        _mdToDeltaConverter.convert(state.diaryDetailsDataState.diary?.contents ?? ""));
                  } else if (state.diaryDetailsDataState is LoadingDiaryDetailsState) {
                    _editorController.document = Document.fromDelta(Delta()..insert("Loading..."));
                  }
                },
                buildWhen: (previous, current) => current.diaryDetailsDataState != previous.diaryDetailsDataState,
                builder: (context, state) {
                  bool isLoading = state.diaryDetailsDataState is LoadingDiaryDetailsState;

                  return Column(
                    children: [
                      DiaryDetailsPageBar(diaryTitle: state.diaryDetailsDataState.diary?.title ?? ""),
                      Expanded(
                        child: Column(
                          children: [
                            Skeletonizer(
                              enabled: isLoading,
                              enableSwitchAnimation: true,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
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
                                            state.diaryDetailsDataState.diary?.entryDate.day.toString() ?? "12",
                                            style: Theme.of(context).appTexts.heading.copyWith(fontSize: 48),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            DateFormat("MMMM")
                                                .format(state.diaryDetailsDataState.diary?.entryDate ?? DateTime.now()),
                                            style: Theme.of(context).appTexts.body,
                                          )
                                        ],
                                      ),
                                      Text(
                                        state.diaryDetailsDataState.diary?.analysis?.primaryEmotion.emoji ?? "😀",
                                        style: TextStyle(fontSize: 36, height: 0.8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity: isLoading ? 1 : 0,
                                      child: Skeletonizer.zone(
                                        enabled: isLoading,
                                        child: Bone.multiText(
                                          lines: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Scrollbar(
                                    controller: _scrollController,
                                    child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity: isLoading ? 0 : 1,
                                      child: QuillEditor.basic(
                                        scrollController: _scrollController,
                                        controller: _editorController,
                                        configurations: QuillEditorConfigurations(
                                            embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                                            showCursor: false,
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, MediaQuery.of(context).size.height * 0.4)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
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
          Skeletonizer(
            enabled: diaryTitle.isEmpty,
            enableSwitchAnimation: true,
            child: Text(
              diaryTitle.isEmpty ? "일기 제목입니다." : diaryTitle,
              style: Theme.of(context).appTexts.body.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
