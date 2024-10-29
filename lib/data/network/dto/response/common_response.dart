import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CommonResponse<T> {
  @JsonKey(name: "isSuccess")
  bool? isSuccess;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  T? data;

  CommonResponse(this.isSuccess, this.code, this.message, this.data);

  factory CommonResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CommonResponseFromJson(json, fromJsonT);
}
