import 'package:alda_front/domain/model/emotion.dart';

class DiaryAnalysis {
  final Emotion primaryEmotion;
  final Emotion? secondaryEmotion;
  final Emotion? tertiaryEmotion;

  DiaryAnalysis({required this.primaryEmotion, this.secondaryEmotion, this.tertiaryEmotion});
}
