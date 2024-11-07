part of 'diary_edit_bloc.dart';

final class DiaryEditState extends Equatable {
  final bool canFeedback;
  final DiaryFeedbackState feedbackState;
  final String diaryTitle;
  final String diaryContents;
  final DateTime diaryEntryDate;

  const DiaryEditState(
      {required this.canFeedback,
      required this.feedbackState,
      required this.diaryTitle,
      required this.diaryContents,
      required this.diaryEntryDate});

  factory DiaryEditState.initial() {
    return DiaryEditState(
        canFeedback: false,
        feedbackState: LoadingDiaryFeedbackState(),
        diaryTitle: '',
        diaryContents: '',
        diaryEntryDate: DateTime.now());
  }

  DiaryEditState copyWith(
      {bool? canFeedback,
      DiaryFeedbackState? feedbackState,
      String? diaryTitle,
      String? diaryContents,
      DateTime? diaryEntryDate}) {
    return DiaryEditState(
        canFeedback: canFeedback ?? this.canFeedback,
        feedbackState: feedbackState ?? this.feedbackState,
        diaryTitle: diaryTitle ?? this.diaryTitle,
        diaryContents: diaryContents ?? this.diaryContents,
        diaryEntryDate: diaryEntryDate ?? this.diaryEntryDate);
  }

  @override
  List<Object?> get props => [canFeedback, feedbackState, diaryTitle, diaryContents, diaryEntryDate];
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
