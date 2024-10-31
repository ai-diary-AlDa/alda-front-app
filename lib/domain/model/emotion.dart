import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum Emotion {
  happy("HAPPY", '😄'),
  sad("SAD", '😢'),
  angry("ANGRY", '😡'),
  fear("FEAR", '😨'),
  surprise("SURPRISE", '😲'),
  disgust("DISGUST", '🤢'),
  neutral("NEUTRAL", '😐');

  final String value;
  final String emoji;

  const Emotion(this.value, this.emoji);
}
