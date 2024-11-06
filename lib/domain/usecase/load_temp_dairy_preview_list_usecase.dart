import 'package:alda_front/data/repository/temp_diary_repository.dart';
import 'package:alda_front/domain/model/temp_diary.dart';
import 'package:alda_front/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadTempDairyPreviewListUsecase extends BaseUsecase {
  final TempDiaryRepository _tempDiaryRepository;

  LoadTempDairyPreviewListUsecase(this._tempDiaryRepository);

  @override
  Future<Either<String, List<TempDiary>>> execute(void input) async {
    return await _tempDiaryRepository.getMyTempDiaries();
  }
}
