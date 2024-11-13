import 'package:alda_front/data/network/dto/response/diary_response.dart';
import 'package:alda_front/data/network/dto/response/temp_diary_response.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/diary_analysis.dart';
import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/domain/model/temp_diary.dart';

extension DiaryPreviewResponseTranslator on DiaryPreviewResponse {
  Diary toDomain() {
    return Diary(
      id: id,
      title: title,
      entryDate: entryDate,
      contents: contents,
      analysis: DiaryAnalysis(primaryEmotion: primaryEmotion),
    );
  }
}

extension DiaryPreviewListResponseTranslator on DiaryPreviewListResponse {
  List<Diary> toDomain() {
    return diaries.map((e) => e.toDomain()).toList();
  }
}

extension TempDiaryPreviewResponseTranslator on TempDiaryPreviewResponse {
  TempDiary toDomain() {
    return TempDiary(
      id: id,
      title: title,
      contents: contents,
      updatedAt: updatedAt,
      entryDate: entryDate,
    );
  }
}

extension TempDiaryPreviewListResponseTranslator on TempDiaryPreviewListResponse {
  List<TempDiary> toDomain() {
    return tempDiaries.map((e) => e.toDomain()).toList();
  }
}

extension DiaryFeedbackResponseTranslator on DiaryFeedbackResponse {
  DiaryFeedback toDomain() {
    return DiaryFeedback(
      startIndex: startIndex,
      endIndex: endIndex,
      feedback: feedback,
    );
  }
}

extension DiaryFeedbackListResponseTranslator on DiaryFeedbackListResponse {
  List<DiaryFeedback> toDomain() {
    return feedbacks.map((e) => e.toDomain()).toList();
  }
}
