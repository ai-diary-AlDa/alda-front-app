import 'package:alda_front/data/network/dto/response/common_response.dart';
import 'package:alda_front/data/network/dto/response/temp_diary_response.dart';
import 'package:alda_front/data/network/service/diary_service.dart';
import 'package:alda_front/data/repository/temp_diary_repository.dart';
import 'package:alda_front/data/translator/translator.dart';
import 'package:alda_front/domain/model/temp_diary.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TempDiaryRepository)
class TempDiaryRepositoryImpl extends TempDiaryRepository {
  final DiaryService _diaryService;

  TempDiaryRepositoryImpl({required DiaryService diaryService}) : _diaryService = diaryService;

  @override
  Future<Either<String, List<TempDiary>>> getMyTempDiaries() async {
    try {
      final CommonResponse<TempDiaryPreviewListResponse> response = await _diaryService.getMyTempDiaries();

      return Right(response.data!.toDomain());
    } on DioException catch (ex) {
      if (ex.response != null) {
        if (ex.response!.data != null) {
          return Left(ex.response!.data.toString());
        } else {
          return Left(ex.response!.statusMessage ?? '임시 저장 일기 목록 조회 요청 - 서버 에러 01');
        }
      } else {
        return Left('임시 저장 일기 목록 조회 요청 - 서버 에러 02');
      }
    } catch (ex) {
      return Left(ex.toString());
    }
  }
}
