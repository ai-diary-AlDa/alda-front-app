import 'package:alda_front/data/network/dto/response/diary_response.dart';
import 'package:alda_front/domain/model/diary.dart';

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
