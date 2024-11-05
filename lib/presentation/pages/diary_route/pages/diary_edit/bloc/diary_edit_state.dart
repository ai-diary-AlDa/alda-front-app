part of 'diary_edit_bloc.dart';

final class DiaryEditState extends Equatable {
  final bool isDiaryFeedbacked;
  final DiaryFeedbackState feedbackState;

  const DiaryEditState(
      {required this.isDiaryFeedbacked, required this.feedbackState});

  factory DiaryEditState.initial() {
    return DiaryEditState(
        isDiaryFeedbacked: false, feedbackState: LoadingDiaryFeedbackState());
  }

  DiaryEditState copyWith(
      {bool? isDiaryFeedbacked, DiaryFeedbackState? feedbackState}) {
    return DiaryEditState(
        isDiaryFeedbacked: isDiaryFeedbacked ?? this.isDiaryFeedbacked,
        feedbackState: feedbackState ?? this.feedbackState);
  }

  @override
  List<Object?> get props => [isDiaryFeedbacked, feedbackState];
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
