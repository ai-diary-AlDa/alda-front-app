// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_diary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempDiaryPreviewResponse _$TempDiaryPreviewResponseFromJson(
        Map<String, dynamic> json) =>
    TempDiaryPreviewResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      contents: json['contents'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TempDiaryPreviewResponseToJson(
        TempDiaryPreviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'entryDate': instance.entryDate.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

TempDiaryPreviewListResponse _$TempDiaryPreviewListResponseFromJson(
        Map<String, dynamic> json) =>
    TempDiaryPreviewListResponse(
      tempDiaries: (json['tempDiaries'] as List<dynamic>)
          .map((e) =>
              TempDiaryPreviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TempDiaryPreviewListResponseToJson(
        TempDiaryPreviewListResponse instance) =>
    <String, dynamic>{
      'tempDiaries': instance.tempDiaries,
    };
