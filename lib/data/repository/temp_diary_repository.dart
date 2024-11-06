import 'package:alda_front/domain/model/temp_diary.dart';
import 'package:dartz/dartz.dart';

abstract class TempDiaryRepository {
  Future<Either<String, List<TempDiary>>> getMyTempDiaries();
}
