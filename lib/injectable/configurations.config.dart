// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/network/service/diary_service.dart' as _i271;
import '../data/repository/diary_repository.dart' as _i787;
import '../data/repository/impl/diary_repository_impl.dart' as _i521;
import '../data/repository/impl/temp_diary_repository_impl.dart' as _i263;
import '../data/repository/temp_diary_repository.dart' as _i847;
import '../domain/usecase/load_diary_feedbacks_usecase.dart' as _i105;
import '../domain/usecase/load_diary_preview_list_usecase.dart' as _i813;
import '../domain/usecase/load_temp_dairy_preview_list_usecase.dart' as _i229;
import '../presentation/pages/diary_route/pages/diary_edit/bloc/diary_edit_bloc.dart'
    as _i1000;
import '../presentation/pages/diary_route/pages/diary_topic_select/bloc/diary_topic_select_bloc.dart'
    as _i634;
import '../presentation/pages/main_route/pages/calendar/bloc/calendar_bloc.dart'
    as _i820;
import '../presentation/pages/main_route/pages/home/bloc/diary_preview_list_bloc.dart'
    as _i171;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i1000.DiaryEditBloc>(() => _i1000.DiaryEditBloc());
  gh.factory<_i820.CalendarBloc>(() => _i820.CalendarBloc());
  gh.lazySingleton<_i847.TempDiaryRepository>(() =>
      _i263.TempDiaryRepositoryImpl(diaryService: gh<_i271.DiaryService>()));
  gh.lazySingleton<_i787.DiaryRepository>(
      () => _i521.DiaryRepositoryImpl(diaryService: gh<_i271.DiaryService>()));
  gh.factory<_i229.LoadTempDairyPreviewListUsecase>(() =>
      _i229.LoadTempDairyPreviewListUsecase(gh<_i847.TempDiaryRepository>()));
  gh.factory<_i813.LoadDiaryPreviewListUsecase>(
      () => _i813.LoadDiaryPreviewListUsecase(gh<_i787.DiaryRepository>()));
  gh.factory<_i105.LoadDiaryFeedbacksUsecase>(
      () => _i105.LoadDiaryFeedbacksUsecase(gh<_i787.DiaryRepository>()));
  gh.factory<_i634.DiaryTopicSelectBloc>(() =>
      _i634.DiaryTopicSelectBloc(gh<_i229.LoadTempDairyPreviewListUsecase>()));
  gh.factory<_i171.DiaryPreviewListBloc>(() =>
      _i171.DiaryPreviewListBloc(gh<_i813.LoadDiaryPreviewListUsecase>()));
  return getIt;
}
