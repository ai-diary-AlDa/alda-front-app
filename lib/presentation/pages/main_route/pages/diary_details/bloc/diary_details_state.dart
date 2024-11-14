part of 'diary_details_bloc.dart';

final class DiaryDetailsState extends Equatable {
  final DiaryDetailsDataState diaryDetailsDataState;

  const DiaryDetailsState({required this.diaryDetailsDataState});

  @override
  List<Object?> get props => [diaryDetailsDataState];

  factory DiaryDetailsState.initial() {
    return DiaryDetailsState(diaryDetailsDataState: LoadingDiaryDetailsState());
  }

  DiaryDetailsState copyWith({DiaryDetailsDataState? diaryDetailsDataState}) {
    return DiaryDetailsState(diaryDetailsDataState: diaryDetailsDataState ?? this.diaryDetailsDataState);
  }
}

abstract class DiaryDetailsDataState extends Equatable {
  final DataLoadStatus status;
  final Diary? diary;

  const DiaryDetailsDataState({required this.status, this.diary});

  @override
  List<Object?> get props => [status, diary];
}

class LoadingDiaryDetailsState extends DiaryDetailsDataState {
  const LoadingDiaryDetailsState() : super(status: DataLoadStatus.loading);
}

class LoadedDiaryDetailsState extends DiaryDetailsDataState {
  const LoadedDiaryDetailsState(Diary diary) : super(status: DataLoadStatus.loaded, diary: diary);
}

class ErrorDiaryDetailsState extends DiaryDetailsDataState {
  const ErrorDiaryDetailsState() : super(status: DataLoadStatus.error);
}
