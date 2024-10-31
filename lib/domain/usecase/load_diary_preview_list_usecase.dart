import 'package:alda_front/data/repository/diary_repository.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadDiaryPreviewListUsecase extends BaseUsecase<void, List<Diary>> {
  final DiaryRepository _diaryRepository;

  LoadDiaryPreviewListUsecase(this._diaryRepository);

  @override
  Future<Either<String, List<Diary>>> execute(void input) async {
    return await _diaryRepository.getMyDiaries();
  }
}
