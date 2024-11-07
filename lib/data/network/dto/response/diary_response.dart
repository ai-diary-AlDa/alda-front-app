import 'package:alda_front/domain/model/emotion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_response.g.dart';

@JsonSerializable()
class DiaryPreviewListResponse {
  @JsonKey(name: "diaries")
  List<DiaryPreviewResponse> diaries;

  DiaryPreviewListResponse(this.diaries);

  factory DiaryPreviewListResponse.fromJson(Map<String, dynamic> json) => _$DiaryPreviewListResponseFromJson(json);
}

@JsonSerializable()
class DiaryPreviewResponse {
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
class DiaryFeedbackResponse {
  int startIndex;
  int endIndex;
  String feedback;

  DiaryFeedbackResponse(this.startIndex, this.endIndex, this.feedback);

  factory DiaryFeedbackResponse.fromJson(Map<String, dynamic> json) => _$DiaryFeedbackResponseFromJson(json);
}

@JsonSerializable()
class DiaryFeedbackListResponse {
  List<DiaryFeedbackResponse> feedbacks;

  DiaryFeedbackListResponse(this.feedbacks);

  factory DiaryFeedbackListResponse.fromJson(Map<String, dynamic> json) => _$DiaryFeedbackListResponseFromJson(json);
}
