import 'package:alda_front/data/repository/diary_repository.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadDiaryDetailsUsecase extends BaseUsecase<LoadDiaryDetailsUsecaseInput, Diary> {
  final DiaryRepository _diaryRepository;

  LoadDiaryDetailsUsecase(this._diaryRepository);

  @override
  Future<Either<String, Diary>> execute(LoadDiaryDetailsUsecaseInput input) async {
    return await _diaryRepository.getDiaryDetails(input.diaryId);
  }
}

class LoadDiaryDetailsUsecaseInput {
  final String diaryId;

  LoadDiaryDetailsUsecaseInput({required this.diaryId});
}
