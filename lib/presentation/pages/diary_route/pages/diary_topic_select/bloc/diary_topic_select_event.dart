part of 'diary_topic_select_bloc.dart';

abstract class DiaryTopicSelectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoadTempDiaryListEvent extends DiaryTopicSelectEvent {}
