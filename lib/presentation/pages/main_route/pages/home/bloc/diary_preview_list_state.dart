part of 'diary_preview_list_bloc.dart';

abstract class DiaryPreviewListState extends Equatable {
  final DataLoadStatus status;
  final List<Diary>? diaries;

  const DiaryPreviewListState({required this.status, this.diaries});

  @override
  List<Object?> get props => [status, diaries];
}

class EmptyDiaryPreviewListState extends DiaryPreviewListState {
  const EmptyDiaryPreviewListState() : super(status: DataLoadStatus.empty);
}

class LoadingDiaryPreviewListState extends DiaryPreviewListState {
  const LoadingDiaryPreviewListState() : super(status: DataLoadStatus.loading);
}

class LoadedDiaryPreviewListState extends DiaryPreviewListState {
  const LoadedDiaryPreviewListState(List<Diary> diaries)
      : super(status: DataLoadStatus.loaded, diaries: diaries);
}

class ErrorDiaryPreviewListState extends DiaryPreviewListState {
  const ErrorDiaryPreviewListState() : super(status: DataLoadStatus.error);
}
