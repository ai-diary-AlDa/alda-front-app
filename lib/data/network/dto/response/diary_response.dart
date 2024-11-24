import 'package:alda_front/domain/model/emotion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_response.g.dart';

@JsonSerializable()
final class DiaryPreviewListResponse {
  @JsonKey(name: "diaries")
  List<DiaryPreviewResponse> diaries;

  DiaryPreviewListResponse(this.diaries);

  factory DiaryPreviewListResponse.fromJson(Map<String, dynamic> json) => _$DiaryPreviewListResponseFromJson(json);
}

@JsonSerializable()
final class DiaryPreviewResponse {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "entryDate")
  DateTime entryDate;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "contents")
  String contents;

  @JsonKey(name: "primaryEmotion")
  Emotion primaryEmotion;

  DiaryPreviewResponse(this.id, this.entryDate, this.title, this.contents, this.primaryEmotion);

  factory DiaryPreviewResponse.fromJson(Map<String, dynamic> json) => _$DiaryPreviewResponseFromJson(json);
}

@JsonSerializable()
final class DiaryFeedbackResponse {
  int startIndex;
  int endIndex;
  String feedback;

  DiaryFeedbackResponse(this.startIndex, this.endIndex, this.feedback);

  factory DiaryFeedbackResponse.fromJson(Map<String, dynamic> json) => _$DiaryFeedbackResponseFromJson(json);
}

@JsonSerializable()
final class DiaryFeedbackListResponse {
  List<DiaryFeedbackResponse> feedbacks;

  DiaryFeedbackListResponse(this.feedbacks);

  factory DiaryFeedbackListResponse.fromJson(Map<String, dynamic> json) => _$DiaryFeedbackListResponseFromJson(json);
}

@JsonSerializable()
final class DiaryDetailsResponse {
  String id;
  DateTime entryDate;
  String title;
  String contents;
  DiaryAnalysisResponse analysis;
  List<DiaryFeedbackResponse> feedbacks;

  DiaryDetailsResponse(this.id, this.entryDate, this.title, this.contents, this.analysis, this.feedbacks);

  factory DiaryDetailsResponse.fromJson(Map<String, dynamic> json) => _$DiaryDetailsResponseFromJson(json);
}

@JsonSerializable()
final class DiaryAnalysisResponse {
  Emotion primaryEmotion;
  Emotion? secondaryEmotion;
  Emotion? tertiaryEmotion;

  DiaryAnalysisResponse(this.primaryEmotion, this.secondaryEmotion, this.tertiaryEmotion);

  factory DiaryAnalysisResponse.fromJson(Map<String, dynamic> json) => _$DiaryAnalysisResponseFromJson(json);
}

@JsonSerializable()
final class DiaryCreatedResponse {
  final String id;

  DiaryCreatedResponse(this.id);

  factory DiaryCreatedResponse.fromJson(Map<String, dynamic> json) => _$DiaryCreatedResponseFromJson(json);
}
