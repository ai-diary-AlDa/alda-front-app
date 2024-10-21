import 'package:alda_front/presentation/pages/home/widgets/diary_preview_card.dart';
import 'package:alda_front/presentation/pages/home/widgets/list_view_shadow.dart';
import 'package:alda_front/presentation/pages/home/widgets/month_indicator.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:grouped_list/grouped_list.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final diaries = List.filled(10, 0)
        .map((index) => Diary(
            title: faker.lorem.sentence(),
            content: faker.lorem.sentence(),
            date: faker.date.dateTimeBetween(
                DateTime.now().subtract(Duration(days: 90)), DateTime.now()),
            mood: "sad"))
        .toList();
    diaries.sort((a, b) => a.date.compareTo(b.date));

    return Expanded(
        child: Stack(alignment: Alignment.bottomCenter, children: [
      GroupedListView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 130),
        elements: diaries,
        groupBy: (diary) => DateTime(diary.date.year, diary.date.month),
        itemBuilder: (context, element) => DiaryPreviewCard(diary: element),
        itemComparator: (item1, item2) => item1.date.compareTo(item2.date),
        groupHeaderBuilder: (element) => MonthIndicator(
          element: element,
          diaries: diaries,
        ),
        stickyHeaderBackgroundColor: AppColors.white,
        useStickyGroupSeparators: true,
        separator: SizedBox(height: 16),
        order: GroupedListOrder.DESC,
      ),
      ListViewShadow()
    ]));
  }
}

class Diary {
  final String title;
  final String content;
  final DateTime date;
  final String mood;

  Diary(
      {required this.title,
      required this.content,
      required this.date,
      required this.mood});
}
