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
import '../domain/usecase/load_diary_preview_list_usecase.dart' as _i813;
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
  gh.factory<_i820.CalendarBloc>(() => _i820.CalendarBloc());
  gh.lazySingleton<_i787.DiaryRepository>(
      () => _i521.DiaryRepositoryImpl(diaryService: gh<_i271.DiaryService>()));
  gh.factory<_i813.LoadDiaryPreviewListUsecase>(
      () => _i813.LoadDiaryPreviewListUsecase(gh<_i787.DiaryRepository>()));
  gh.factory<_i171.DiaryPreviewListBloc>(() =>
      _i171.DiaryPreviewListBloc(gh<_i813.LoadDiaryPreviewListUsecase>()));
  return getIt;
}
