import 'dart:async';

import 'package:alda_front/domain/model/temp_diary.dart';
import 'package:alda_front/domain/usecase/load_temp_dairy_preview_list_usecase.dart';
import 'package:alda_front/presentation/common/bloc/data_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'diary_topic_select_event.dart';
part 'diary_topic_select_state.dart';

@injectable
class DiaryTopicSelectBloc extends Bloc<DiaryTopicSelectEvent, DiaryTopicSelectState> {
  final LoadTempDairyPreviewListUsecase _loadTempDairyPreviewListUsecase;

  DiaryTopicSelectBloc(this._loadTempDairyPreviewListUsecase) : super(DiaryTopicSelectState.initial()) {
    on<LoadTempDiaryListEvent>(_onLoadTempDiaryList);
  }

  Future<void> _onLoadTempDiaryList(LoadTempDiaryListEvent event, Emitter<DiaryTopicSelectState> emit) async {
    emit(state.copyWith(tempDiaryPreviewListState: LoadingTempDiaryPreviewListState()));

    final result = await _loadTempDairyPreviewListUsecase.execute(null);
    result.fold(
        (error) => emit(state.copyWith(tempDiaryPreviewListState: ErrorTempDiaryPreviewListState())),
        (tempDiaries) => tempDiaries.isEmpty
            ? emit(state.copyWith(tempDiaryPreviewListState: EmptyTempDiaryPreviewListState()))
            : emit(
                state.copyWith(tempDiaryPreviewListState: LoadedTempDiaryPreviewListState(tempDiaries: tempDiaries)),
              ));
  }
}
