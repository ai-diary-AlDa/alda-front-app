import 'package:alda_front/data/network/dto/request/diary_reqeust.dart';
import 'package:alda_front/data/repository/diary_repository.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadDiaryFeedbacksUsecase extends BaseUsecase<LoadDiaryFeedbacksUsecaseInput, List<DiaryFeedback>> {
  final DiaryRepository _diaryRepository;

  LoadDiaryFeedbacksUsecase(this._diaryRepository);

  @override
  Future<Either<String, List<DiaryFeedback>>> execute(LoadDiaryFeedbacksUsecaseInput input) async {
    return await _diaryRepository.getDiaryFeedbacks(
        GetDiaryFeedbacksReqeust(title: input.title, contents: input.contents, entryDate: input.entryDate));
  }
}

class LoadDiaryFeedbacksUsecaseInput {
  final String title;
  final String contents;
  final DateTime entryDate;

  LoadDiaryFeedbacksUsecaseInput({required this.title, required this.contents, required this.entryDate});
}
