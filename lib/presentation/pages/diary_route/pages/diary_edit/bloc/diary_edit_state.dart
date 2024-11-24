part of 'diary_edit_bloc.dart';

final class DiaryEditState extends Equatable {
  final bool canFeedback;
  final DiaryFeedbackState feedbackState;
  final SaveDiaryState saveDiaryState;
  final String diaryTitle;
  final String diaryContents;
  final DateTime diaryEntryDate;
  final bool feedbackView;

  const DiaryEditState(
      {required this.canFeedback,
      required this.saveDiaryState,
      required this.feedbackState,
      required this.diaryTitle,
      required this.diaryContents,
      required this.diaryEntryDate,
      required this.feedbackView});

  factory DiaryEditState.initial() {
    final today = DateTime.now();
    return DiaryEditState(
        canFeedback: false,
        saveDiaryState: SavingDiaryState(),
        feedbackState: LoadingDiaryFeedbackState(),
        diaryTitle: DateFormat("yyyy년 MM월 dd일의 일기").format(today),
        diaryContents: '',
        diaryEntryDate: today,
        feedbackView: false);
  }

  DiaryEditState copyWith(
      {bool? canFeedback,
      DiaryFeedbackState? feedbackState,
      SaveDiaryState? saveDiaryState,
      String? diaryTitle,
      String? diaryContents,
      DateTime? diaryEntryDate,
      bool? feedbackView}) {
    return DiaryEditState(
        canFeedback: canFeedback ?? this.canFeedback,
        feedbackState: feedbackState ?? this.feedbackState,
        diaryTitle: diaryTitle ?? this.diaryTitle,
        diaryContents: diaryContents ?? this.diaryContents,
        diaryEntryDate: diaryEntryDate ?? this.diaryEntryDate,
        feedbackView: feedbackView ?? this.feedbackView,
        saveDiaryState: saveDiaryState ?? this.saveDiaryState);
  }

  @override
  List<Object?> get props =>
      [canFeedback, feedbackState, diaryTitle, diaryContents, diaryEntryDate, feedbackView, saveDiaryState];
}

abstract class DiaryFeedbackState extends Equatable {
  final DataLoadStatus status;
  final List<DiaryFeedback>? feedbacks;

  const DiaryFeedbackState({required this.status, this.feedbacks});

  @override
  List<Object?> get props => [status, feedbacks];
}

class LoadingDiaryFeedbackState extends DiaryFeedbackState {
  const LoadingDiaryFeedbackState() : super(status: DataLoadStatus.loading);
}

class LoadedDiaryFeedbackState extends DiaryFeedbackState {
  const LoadedDiaryFeedbackState(List<DiaryFeedback> feedbacks)
      : super(status: DataLoadStatus.loaded, feedbacks: feedbacks);
}

class ErrorDiaryFeedbackState extends DiaryFeedbackState {
  const ErrorDiaryFeedbackState() : super(status: DataLoadStatus.error);
}

abstract class SaveDiaryState extends Equatable {
  final DataLoadStatus status;

  const SaveDiaryState({required this.status});

  @override
  List<Object?> get props => [status];
}

class SavingDiaryState extends SaveDiaryState {
  const SavingDiaryState() : super(status: DataLoadStatus.loading);
}

class SavedDiaryState extends SaveDiaryState {
  const SavedDiaryState() : super(status: DataLoadStatus.loaded);
}

class ErrorSaveDiaryState extends SaveDiaryState {
  const ErrorSaveDiaryState() : super(status: DataLoadStatus.error);
}
