// GENERATED CODE - DO NOT MODIFY BY HAND

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
  Emotion.happy: 'HAPPY',
  Emotion.sad: 'SAD',
  Emotion.angry: 'ANGRY',
  Emotion.fear: 'FEAR',
  Emotion.surprise: 'SURPRISE',
  Emotion.disgust: 'DISGUST',
  Emotion.neutral: 'NEUTRAL',
};

DiaryFeedbackResponse _$DiaryFeedbackResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryFeedbackResponse(
      (json['startIndex'] as num).toInt(),
      (json['endIndex'] as num).toInt(),
      json['feedback'] as String,
    );

Map<String, dynamic> _$DiaryFeedbackResponseToJson(
        DiaryFeedbackResponse instance) =>
    <String, dynamic>{
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'feedback': instance.feedback,
    };

DiaryFeedbackListResponse _$DiaryFeedbackListResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryFeedbackListResponse(
      (json['feedbacks'] as List<dynamic>)
          .map((e) => DiaryFeedbackResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiaryFeedbackListResponseToJson(
        DiaryFeedbackListResponse instance) =>
    <String, dynamic>{
      'feedbacks': instance.feedbacks,
    };

DiaryDetailsResponse _$DiaryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryDetailsResponse(
      json['id'] as String,
      DateTime.parse(json['entryDate'] as String),
      json['title'] as String,
      json['contents'] as String,
      DiaryAnalysisResponse.fromJson(json['analysis'] as Map<String, dynamic>),
      (json['feedbacks'] as List<dynamic>)
          .map((e) => DiaryFeedbackResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiaryDetailsResponseToJson(
        DiaryDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entryDate': instance.entryDate.toIso8601String(),
      'title': instance.title,
      'contents': instance.contents,
      'analysis': instance.analysis,
      'feedbacks': instance.feedbacks,
    };

DiaryAnalysisResponse _$DiaryAnalysisResponseFromJson(
        Map<String, dynamic> json) =>
    DiaryAnalysisResponse(
      $enumDecode(_$EmotionEnumMap, json['primaryEmotion']),
      $enumDecodeNullable(_$EmotionEnumMap, json['secondaryEmotion']),
      $enumDecodeNullable(_$EmotionEnumMap, json['tertiaryEmotion']),
    );

Map<String, dynamic> _$DiaryAnalysisResponseToJson(
        DiaryAnalysisResponse instance) =>
    <String, dynamic>{
      'primaryEmotion': _$EmotionEnumMap[instance.primaryEmotion]!,
      'secondaryEmotion': _$EmotionEnumMap[instance.secondaryEmotion],
      'tertiaryEmotion': _$EmotionEnumMap[instance.tertiaryEmotion],
    };
