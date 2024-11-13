import 'dart:async';
import 'dart:math';

import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/domain/usecase/load_diary_feedbacks_usecase.dart';
import 'package:alda_front/presentation/common/bloc/data_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'diary_edit_state.dart';
part 'diary_edit_event.dart';

@injectable
class DiaryEditBloc extends Bloc<DiaryEditEvent, DiaryEditState> {
  final LoadDiaryFeedbacksUsecase _loadDiaryFeedbacksUsecase;

  DiaryEditBloc(this._loadDiaryFeedbacksUsecase) : super(DiaryEditState.initial()) {
    on<LoadDiaryFeedbackEvent>(_onLoadDiaryFeedback);
    on<DiaryContentsChangedEvent>(_onDiaryContentsChanged);
    on<ToggleFeedbackViewEvent>(_onToggleFeedbackView);
  }

  Future<void> _onLoadDiaryFeedback(LoadDiaryFeedbackEvent event, Emitter<DiaryEditState> emit) async {
    emit(state.copyWith(feedbackState: LoadingDiaryFeedbackState()));

    final result = await _loadDiaryFeedbacksUsecase.execute(LoadDiaryFeedbacksUsecaseInput(
        contents: state.diaryContents, entryDate: state.diaryEntryDate, title: state.diaryTitle));

    result.fold(
      (error) => emit(state.copyWith(feedbackState: ErrorDiaryFeedbackState())),
      (feedbacks) {
        final random = Random();
        final randomFeedbacks =
            List.generate(feedbacks.length ~/ 3, (_) => feedbacks[random.nextInt(feedbacks.length)]);
        emit(state.copyWith(canFeedback: false, feedbackState: LoadedDiaryFeedbackState(randomFeedbacks)));
      },
    );
  }

  void _onDiaryContentsChanged(DiaryContentsChangedEvent event, Emitter<DiaryEditState> emit) {
    emit(state.copyWith(canFeedback: event.contents.trim().isEmpty ? false : true, diaryContents: event.contents));
  }

  void _onToggleFeedbackView(ToggleFeedbackViewEvent event, Emitter<DiaryEditState> emit) {
    emit(state.copyWith(feedbackView: !state.feedbackView));
  }
}
