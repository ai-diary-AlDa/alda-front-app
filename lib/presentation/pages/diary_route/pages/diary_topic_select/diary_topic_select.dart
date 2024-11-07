import 'package:alda_front/injectable/configurations.dart';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_topic_select/bloc/diary_topic_select_bloc.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_topic_select/widgets/diary_topic_select_fab.dart';
import 'package:alda_front/presentation/pages/diary_route/pages/diary_topic_select/widgets/temp_diary_preview_card.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DiaryTopicSelectPage extends StatelessWidget {
  const DiaryTopicSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    DiaryTopicSelectPageBar(),
                    Column(
                      children: [
                        Header(),
                        SizedBox(height: 20),
                        BlocProvider(
                          create: (_) => getIt<DiaryTopicSelectBloc>()..add(LoadTempDiaryListEvent()),
                          child: Column(
                            children: [
                              BlocBuilder<DiaryTopicSelectBloc, DiaryTopicSelectState>(builder: (context, state) {
                                if (state.tempDiaryPreivewListState is LoadedTempDiaryPreviewListState) {
                                  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                    Text(
                                      "임시 저장한 일기",
                                      style: Theme.of(context).appTexts.title,
                                    ),
                                    SizedBox(height: 8),
                                    ...state.tempDiaryPreivewListState.tempDiaries!
                                        .map((tempDiary) => TempDiaryPreviewCard(tempDiary: tempDiary)),
                                  ]);
                                }
                                return SizedBox.shrink();
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            DiaryTopicSelectFab(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("주제를 골라보세요.", style: Theme.of(context).appTexts.heading),
        Text("빠르고 쉽게 일기를 쓰기 위해 주제를 추천해드릴게요.", style: Theme.of(context).appTexts.body),
      ],
    );
  }
}

class DiaryTopicSelectPageBar extends StatelessWidget {
  const DiaryTopicSelectPageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Button(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.close,
              color: AppColors.black01,
              size: 28,
            ),
            onPressed: () {
              context.tabsRouter.maybePop();
            }),
      ],
    );
  }
}
