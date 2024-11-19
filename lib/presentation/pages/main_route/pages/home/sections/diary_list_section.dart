import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/diary_analysis.dart';
import 'package:alda_front/domain/model/emotion.dart';
import 'package:alda_front/injectable/configurations.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/bloc/diary_preview_list_bloc.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/widgets/diary_preview_card.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/widgets/list_view_shadow.dart';
import 'package:alda_front/presentation/pages/main_route/pages/home/widgets/month_indicator.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiaryListSection extends StatefulWidget {
  const DiaryListSection({super.key});

  @override
  State<DiaryListSection> createState() => _DiaryListSectionState();
}

class _DiaryListSectionState extends State<DiaryListSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiaryPreviewListBloc>(
        create: (context) => getIt<DiaryPreviewListBloc>()..add(LoadDiaryPreviewListEvent()),
        child: Expanded(
          child: BlocBuilder<DiaryPreviewListBloc, DiaryPreviewListState>(
              buildWhen: (prev, cur) => prev.status != cur.status || prev.diaries != cur.diaries,
              builder: (context, state) {
                final isLoading = state is LoadingDiaryPreviewListState;
                if (state is EmptyDiaryPreviewListState) {
                  return RefreshIndicator.adaptive(
                    onRefresh: () => _onRefresh(context),
                    child: LayoutBuilder(builder: (contex, constraints) {
                      return SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 160.0),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/empty_diary_list.svg",
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(height: 32),
                                Text(
                                  "일기가 없어요...",
                                  style: Theme.of(context).appTexts.title.copyWith(
                                        color: AppColors.black02,
                                      ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "아직 일기를 작성하지 않으셨네요!\n어떤 일이 있었는지 적어보세요.",
                                  style: Theme.of(context).appTexts.body,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                          ),
                        ),
                      );
                    }),
                  );
                } else if (state is LoadedDiaryPreviewListState || state is LoadingDiaryPreviewListState) {
                  List<Diary> diaries = isLoading
                      ? List.filled(
                          7,
                          Diary(
                              id: "1",
                              entryDate: DateTime.now(),
                              contents: "다이어리 내용 다이어리 내용",
                              title: "다이어리 제목",
                              analysis: DiaryAnalysis(primaryEmotion: Emotion.happy)))
                      : state.diaries!;
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      RefreshIndicator.adaptive(
                        onRefresh: () => _onRefresh(context),
                        child: Skeletonizer(
                          enabled: isLoading,
                          enableSwitchAnimation: true,
                          child: GroupedListView(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 130),
                            elements: diaries,
                            groupBy: (diary) => DateTime(diary.entryDate.year, diary.entryDate.month),
                            itemBuilder: (innerContext, element) => DiaryPreviewCard(
                              diary: element,
                              isLoading: isLoading,
                            ),
                            itemComparator: (item1, item2) => item1.entryDate.compareTo(item2.entryDate),
                            groupHeaderBuilder: (element) => MonthIndicator(
                              element: element,
                              diaries: diaries,
                            ),
                            stickyHeaderBackgroundColor: AppColors.white,
                            // useStickyGroupSeparators: true,
                            separator: SizedBox(height: 16),
                            order: GroupedListOrder.DESC,
                          ),
                        ),
                      ),
                      ListViewShadow()
                    ],
                  );
                } else {
                  return RefreshIndicator.adaptive(onRefresh: () {
                    context.read<DiaryPreviewListBloc>().add(LoadDiaryPreviewListEvent());
                    return Future.value();
                  }, child: LayoutBuilder(builder: (contex, constraints) {
                    return SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 160.0),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/error.svg",
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 32),
                              Text(
                                "일기를 불러오지 못했어요...",
                                style: Theme.of(context).appTexts.title.copyWith(
                                      color: AppColors.black02,
                                    ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "내부 오류로 조회에 실패했어요!\n잠시 후 다시 시도해주세요.",
                                style: Theme.of(context).appTexts.body,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                        ),
                      ),
                    );
                  }));
                }
              }),
        ));
  }

  Future<void> _onRefresh(BuildContext context) async {
    context.read<DiaryPreviewListBloc>().add(LoadDiaryPreviewListEvent());
  }
}
