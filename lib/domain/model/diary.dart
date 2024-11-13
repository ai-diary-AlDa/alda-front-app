import 'package:alda_front/domain/model/diary_analysis.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';

class Diary {
  final String id;
  final DateTime entryDate;
  final String contents;
  final String title;
  final DiaryAnalysis? analysis;
  final List<DiaryFeedback>? feedbacks;

  const Diary({
    required this.id,
    required this.entryDate,
    required this.contents,
    required this.title,
    this.analysis,
    this.feedbacks,
  });
}
