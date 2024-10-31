// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'diary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryPreviewListResponse _$DiaryPreviewListResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryPreviewListResponse(
      (json['diaries'] as List<dynamic>)
          .map((e) => DiaryPreviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiaryPreviewListResponseToJson(
        DiaryPreviewListResponse instance) =>
    <String, dynamic>{
      'diaries': instance.diaries,
    };

DiaryPreviewResponse _$DiaryPreviewResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryPreviewResponse(
      json['id'] as String,
      DateTime.parse(json['entryDate'] as String),
      json['title'] as String,
      json['contents'] as String,
      $enumDecode(_$EmotionEnumMap, json['primaryEmotion']),
    );

Map<String, dynamic> _$DiaryPreviewResponseToJson(
        DiaryPreviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entryDate': instance.entryDate.toIso8601String(),
      'title': instance.title,
      'contents': instance.contents,
      'primaryEmotion': _$EmotionEnumMap[instance.primaryEmotion]!,
    };

const _$EmotionEnumMap = {
  Emotion.happy: 0,
  Emotion.sad: 1,
  Emotion.angry: 2,
  Emotion.fear: 3,
  Emotion.surprise: 4,
  Emotion.disgust: 5,
  Emotion.neutral: 6,
};
