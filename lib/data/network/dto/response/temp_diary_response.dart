import 'package:json_annotation/json_annotation.dart';

part 'temp_diary_response.g.dart';

@JsonSerializable()
class TempDiaryPreviewResponse {
  final String id;
  final String title;
  final String contents;
  final DateTime entryDate;
  final DateTime updatedAt;

  TempDiaryPreviewResponse(
      {required this.id,
      required this.title,
      required this.contents,
      required this.entryDate,
      required this.updatedAt});

  factory TempDiaryPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$TempDiaryPreviewResponseFromJson(json);
}

@JsonSerializable()
class TempDiaryPreviewListResponse {
  final List<TempDiaryPreviewResponse> tempDiaries;

  TempDiaryPreviewListResponse({required this.tempDiaries});

  factory TempDiaryPreviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$TempDiaryPreviewListResponseFromJson(json);
}
