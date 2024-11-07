// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_reqeust.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDiaryFeedbacksReqeust _$GetDiaryFeedbacksReqeustFromJson(
        Map<String, dynamic> json) =>
    GetDiaryFeedbacksReqeust(
      title: json['title'] as String,
      contents: json['contents'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
    );

Map<String, dynamic> _$GetDiaryFeedbacksReqeustToJson(
        GetDiaryFeedbacksReqeust instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contents': instance.contents,
      'entryDate': instance.entryDate.toIso8601String(),
    };
