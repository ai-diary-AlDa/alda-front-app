import 'package:json_annotation/json_annotation.dart';

part 'diary_reqeust.g.dart';

@JsonSerializable()
class GetDiaryFeedbacksReqeust {
  final String title;
  final String contents;
  final DateTime entryDate;

  GetDiaryFeedbacksReqeust({required this.title, required this.contents, required this.entryDate});

  Map<String, dynamic> toJson() => _$GetDiaryFeedbacksReqeustToJson(this);
}

@JsonSerializable()
class CreateDiaryRequest {
  final String title;
  final DateTime entryDate;
  final String contents;
  final List<CreateDiaryFeedbackRequest> feedbacks;

  CreateDiaryRequest({required this.title, required this.entryDate, required this.contents, required this.feedbacks});

  Map<String, dynamic> toJson() => _$CreateDiaryRequestToJson(this);
}

@JsonSerializable()
class CreateDiaryFeedbackRequest {
  final int startIndex;
  final int endIndex;
  final String contents;

  CreateDiaryFeedbackRequest({required this.startIndex, required this.endIndex, required this.contents});

  Map<String, dynamic> toJson() => _$CreateDiaryFeedbackRequestToJson(this);
  factory CreateDiaryFeedbackRequest.fromJson(Map<String, dynamic> json) => _$CreateDiaryFeedbackRequestFromJson(json);
}
