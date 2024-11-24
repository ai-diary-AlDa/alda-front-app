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

CreateDiaryRequest _$CreateDiaryRequestFromJson(Map<String, dynamic> json) =>
    CreateDiaryRequest(
      title: json['title'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      contents: json['contents'] as String,
      feedbacks: (json['feedbacks'] as List<dynamic>)
          .map((e) =>
              CreateDiaryFeedbackRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateDiaryRequestToJson(CreateDiaryRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'entryDate': instance.entryDate.toIso8601String(),
      'contents': instance.contents,
      'feedbacks': instance.feedbacks,
    };

CreateDiaryFeedbackRequest _$CreateDiaryFeedbackRequestFromJson(
        Map<String, dynamic> json) =>
    CreateDiaryFeedbackRequest(
      startIndex: (json['startIndex'] as num).toInt(),
      endIndex: (json['endIndex'] as num).toInt(),
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$CreateDiaryFeedbackRequestToJson(
        CreateDiaryFeedbackRequest instance) =>
    <String, dynamic>{
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'contents': instance.contents,
    };
