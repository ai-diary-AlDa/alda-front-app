import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum Emotion {
  happy(0, '😄'),
  sad(1, '😢'),
  angry(2, '😡'),
  fear(3, '😨'),
  surprise(4, '😲'),
  disgust(5, '🤢'),
  neutral(6, '😐');

  final int code;
  final String emoji;

  const Emotion(this.code, this.emoji);
}
