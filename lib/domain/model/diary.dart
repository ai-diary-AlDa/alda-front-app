import 'package:alda_front/domain/model/emotion.dart';

class Diary {
  final String id;
  final DateTime entryDate;
  final String contents;
  final String title;
  final Emotion primaryEmotion;

  const Diary(
      {required this.id,
      required this.entryDate,
      required this.contents,
      required this.title,
      required this.primaryEmotion});
}
