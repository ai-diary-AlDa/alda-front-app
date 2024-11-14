part of 'diary_details_bloc.dart';

abstract class DiaryDetailsEvent extends Equatable {
  const DiaryDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadDiaryDetailsEvent extends DiaryDetailsEvent {
  final String diaryId;

  const LoadDiaryDetailsEvent(this.diaryId);

  @override
  List<Object> get props => [diaryId];
}
