import 'package:alda_front/data/network/dto/request/diary_reqeust.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:dartz/dartz.dart';

abstract class DiaryRepository {
  Future<Either<String, List<Diary>>> getMyDiaries();

  Future<Either<String, List<DiaryFeedback>>> getDiaryFeedbacks(GetDiaryFeedbacksReqeust request);
}
