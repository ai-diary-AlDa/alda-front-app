import 'package:alda_front/data/network/dto/response/diary_response.dart';
import 'package:alda_front/data/network/dto/response/temp_diary_response.dart';
import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/model/temp_diary.dart';

extension DiaryPreviewResponseTranslator on DiaryPreviewResponse {
  Diary toDomain() {
    return Diary(
      id: id,
      title: title,
      entryDate: entryDate,
      contents: contents,
      primaryEmotion: primaryEmotion,
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

extension TempDiaryPreviewListResponseTranslator
    on TempDiaryPreviewListResponse {
  List<TempDiary> toDomain() {
    return tempDiaries.map((e) => e.toDomain()).toList();
  }
}
