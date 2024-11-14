import 'package:alda_front/domain/model/diary.dart';
import 'package:alda_front/domain/usecase/load_diary_details_usecase.dart';
import 'package:alda_front/presentation/common/bloc/data_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'diary_details_event.dart';
part 'diary_details_state.dart';

@injectable
class DiaryDetailsBloc extends Bloc<DiaryDetailsEvent, DiaryDetailsState> {
  final LoadDiaryDetailsUsecase _loadDiaryDetailsUsecase;

  DiaryDetailsBloc(this._loadDiaryDetailsUsecase) : super(DiaryDetailsState.initial()) {
    on<LoadDiaryDetailsEvent>(_onLoadDiaryDetails);
  }

  Future<void> _onLoadDiaryDetails(LoadDiaryDetailsEvent event, Emitter<DiaryDetailsState> emit) async {
    emit(state.copyWith(diaryDetailsDataState: LoadingDiaryDetailsState()));

    await Future.delayed(Duration(seconds: 3));

    final result = await _loadDiaryDetailsUsecase.execute(LoadDiaryDetailsUsecaseInput(diaryId: event.diaryId));

    result.fold(
      (error) {
        emit(state.copyWith(diaryDetailsDataState: ErrorDiaryDetailsState()));
      },
      (diary) {
        emit(state.copyWith(diaryDetailsDataState: LoadedDiaryDetailsState(diary)));
      },
    );
  }
}
