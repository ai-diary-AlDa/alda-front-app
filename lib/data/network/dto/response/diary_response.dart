import 'package:json_annotation/json_annotation.dart';

part 'diary_response.g.dart';

@JsonSerializable()
class DiaryPreviewListResponse {
  @JsonKey(name: "diaries")
  List<DiaryPreviewResponse> diaries;

  DiaryPreviewListResponse(this.diaries);

  factory DiaryPreviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$DiaryPreviewListResponseFromJson(json);
}

@JsonSerializable()
class DiaryPreviewResponse {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "entryDate")
  String entryDate;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "contents")
  String contents;

  @JsonKey(name: "primaryEmotion")
  String primaryEmotion;

  DiaryPreviewResponse(
      this.id, this.entryDate, this.title, this.contents, this.primaryEmotion);

  factory DiaryPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$DiaryPreviewResponseFromJson(json);
}
