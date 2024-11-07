import 'package:alda_front/data/network/dto/request/diary_reqeust.dart';
import 'package:alda_front/data/network/dto/response/common_response.dart';
import 'package:alda_front/data/network/dto/response/diary_response.dart';
import 'package:alda_front/data/network/service/diary_service.dart';
import 'package:alda_front/data/repository/diary_repository.dart';
import 'package:alda_front/data/translator/translator.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DiaryRepository)
class DiaryRepositoryImpl extends DiaryRepository {
  final DiaryService _diaryService;

  DiaryRepositoryImpl({required DiaryService diaryService}) : _diaryService = diaryService;

  @override
  Future<Either<String, List<Diary>>> getMyDiaries() async {
    try {
      final CommonResponse<DiaryPreviewListResponse> response = await _diaryService.getMyDiaries();

      return Right(response.data!.toDomain());
    } on DioException catch (ex) {
      if (ex.response != null) {
        if (ex.response!.data != null) {
          return Left(ex.response!.data.toString());
        } else {
          return Left(ex.response!.statusMessage ?? '일기 목록 조회 요청 - 서버 에러 01');
        }
      } else {
        return Left('일기 목록 조회 요청 - 서버 에러 02');
      }
    } catch (ex) {
      return Left(ex.toString());
    }
  }

  @override
  Future<Either<String, List<DiaryFeedback>>> getDiaryFeedbacks(GetDiaryFeedbacksReqeust request) async {
    try {
      final CommonResponse<DiaryFeedbackListResponse> response = await _diaryService.getDiaryFeedbacks(request);

      return Right(response.data!.toDomain());
    } on DioException catch (ex) {
      if (ex.response != null) {
        if (ex.response!.data != null) {
          return Left(ex.response!.data.toString());
        } else {
          return Left(ex.response!.statusMessage ?? '일기 목록 조회 요청 - 서버 에러 01');
        }
      } else {
        return Left('일기 목록 조회 요청 - 서버 에러 02');
      }
    } catch (ex) {
      return Left(ex.toString());
    }
  }
}
