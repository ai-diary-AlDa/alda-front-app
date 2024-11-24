import 'package:alda_front/data/network/dto/request/diary_reqeust.dart';
import 'package:alda_front/data/repository/diary_repository.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveDiaryUsecase extends BaseUsecase<SaveDiaryUsecaseInput, String> {
  final DiaryRepository _diaryRepository;

  SaveDiaryUsecase(this._diaryRepository);

  @override
  Future<Either<String, String>> execute(SaveDiaryUsecaseInput input) async {
    return await _diaryRepository.saveDiary(CreateDiaryRequest(
        title: input.title,
        entryDate: input.entryDate,
        contents: input.contents,
        feedbacks: input.feedbacks
            .map((feedback) => CreateDiaryFeedbackRequest(
                startIndex: feedback.startIndex, endIndex: feedback.endIndex, contents: feedback.contents))
            .toList()));
  }
}

class SaveDiaryUsecaseInput {
  final String title;
  final String contents;
  final DateTime entryDate;
  final List<DiaryFeedback> feedbacks;

  SaveDiaryUsecaseInput(
      {required this.title, required this.contents, required this.entryDate, required this.feedbacks});
}
