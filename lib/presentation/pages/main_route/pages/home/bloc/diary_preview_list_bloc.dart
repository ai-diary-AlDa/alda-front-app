import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/usecase/load_diary_preview_list_usecase.dart';
import 'package:alda_front/presentation/common/data_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'diary_preview_list_event.dart';
part 'diary_preview_list_state.dart';

@injectable
class DiaryPreviewListBloc
    extends Bloc<DiaryPreviewListEvent, DiaryPreviewListState> {
  final LoadDiaryPreviewListUsecase _loadDiaryPreviewListUsecase;

  DiaryPreviewListBloc(this._loadDiaryPreviewListUsecase)
      : super(const LoadingDiaryPreviewListState()) {
    on<LoadDiaryPreviewListEvent>(_onLoadDiaryPreviewList);
  }

  Future<void> _onLoadDiaryPreviewList(LoadDiaryPreviewListEvent event,
      Emitter<DiaryPreviewListState> emit) async {
    emit(LoadingDiaryPreviewListState());

    await Future.delayed(const Duration(seconds: 1));

    final result = await _loadDiaryPreviewListUsecase.execute(null);
    result.fold(
      (error) => emit(const ErrorDiaryPreviewListState()),
      (diaries) {
        if (diaries.isEmpty) {
          emit(const EmptyDiaryPreviewListState());
        } else {
          emit(LoadedDiaryPreviewListState(diaries));
        }
      },
    );
  }
}
