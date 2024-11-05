import 'package:alda_front/data/network/dto/response/common_response.dart';
import 'package:alda_front/data/network/dto/response/diary_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

part 'diary_service.g.dart';

@RestApi(baseUrl: "http://localhost:8080/api/v1/diaries")
abstract class DiaryService {
  factory DiaryService(Dio dio, {String baseUrl}) = _DiaryService;

  @GET("")
  @http.Headers({'authorization': 'true'})
  Future<CommonResponse<DiaryPreviewListResponse>> getMyDiaries();
}
