import 'package:alda_front/domain/model/diary.dart';
import 'package:dartz/dartz.dart';

abstract class DiaryRepository {
  Future<Either<String, List<Diary>>> getMyDiaries();
}
