part of 'diary_edit_bloc.dart';

abstract class DiaryEditEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDiaryFeedbackEvent extends DiaryEditEvent {}

class DiaryContentsChangedEvent extends DiaryEditEvent {
  final String contents;

  DiaryContentsChangedEvent(this.contents);

  @override
  List<Object?> get props => [contents];
}
