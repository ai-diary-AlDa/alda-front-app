import 'dart:async';

import 'package:alda_front/domain/model/diary_feedback.dart';
import 'package:alda_front/presentation/common/data_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'diary_edit_state.dart';
part 'diary_edit_event.dart';

@injectable
class DiaryEditBloc extends Bloc<DiaryEditEvent, DiaryEditState> {
  DiaryEditBloc() : super(DiaryEditState.initial()) {
    on<LoadDiaryFeedbackEvent>(_onLoadDiaryFeedback);
    on<DiaryContentsChangedEvent>(_onDiaryContentsChanged);
  }

  Future<void> _onLoadDiaryFeedback(
      LoadDiaryFeedbackEvent event, Emitter<DiaryEditState> emit) async {
    emit(state.copyWith(feedbackState: LoadingDiaryFeedbackState()));

    await Future.delayed(const Duration(seconds: 60));

    emit(state.copyWith(
        isDiaryFeedbacked: true, feedbackState: LoadedDiaryFeedbackState([])));
  }

  void _onDiaryContentsChanged(
      DiaryContentsChangedEvent event, Emitter<DiaryEditState> emit) {
    emit(state.copyWith(isDiaryFeedbacked: false));
  }
}
