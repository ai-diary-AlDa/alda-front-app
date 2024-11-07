part of 'diary_topic_select_bloc.dart';

final class DiaryTopicSelectState extends Equatable {
  final TempDiaryPreviewListState tempDiaryPreivewListState;

  const DiaryTopicSelectState({required this.tempDiaryPreivewListState});

  DiaryTopicSelectState copyWith({TempDiaryPreviewListState? tempDiaryPreviewListState}) {
    return DiaryTopicSelectState(
      tempDiaryPreivewListState: tempDiaryPreviewListState ?? tempDiaryPreivewListState,
    );
  }

  @override
  List<Object?> get props => [tempDiaryPreivewListState];

  factory DiaryTopicSelectState.initial() {
    return DiaryTopicSelectState(tempDiaryPreivewListState: LoadingTempDiaryPreviewListState());
  }
}

abstract class TempDiaryPreviewListState extends Equatable {
  final DataLoadStatus status;
  final List<TempDiary>? tempDiaries;

  const TempDiaryPreviewListState({required this.status, this.tempDiaries});

  @override
  List<Object?> get props => [status, tempDiaries];
}

final class LoadingTempDiaryPreviewListState extends TempDiaryPreviewListState {
  const LoadingTempDiaryPreviewListState() : super(status: DataLoadStatus.loading);
}

final class LoadedTempDiaryPreviewListState extends TempDiaryPreviewListState {
  const LoadedTempDiaryPreviewListState({required List<TempDiary> tempDiaries})
      : super(status: DataLoadStatus.loaded, tempDiaries: tempDiaries);
}

final class ErrorTempDiaryPreviewListState extends TempDiaryPreviewListState {
  const ErrorTempDiaryPreviewListState() : super(status: DataLoadStatus.error);
}

final class EmptyTempDiaryPreviewListState extends TempDiaryPreviewListState {
  const EmptyTempDiaryPreviewListState() : super(status: DataLoadStatus.empty);
}
