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
