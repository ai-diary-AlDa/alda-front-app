import 'package:alda_front/data/network/api_client.dart';
import 'package:alda_front/data/network/service/diary_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'configurations.config.dart' as config;

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
configureDependencies() => $initGetIt(getIt);

$initGetIt(GetIt getIt,
    {String? environment, EnvironmentFilter? environmentFilter}) {
  final getItHelper = GetItHelper(getIt, environment.toString());

  var apiClient = ApiClient(enableLogging: true);
  getItHelper.factory<Dio>(() => apiClient.apiProvider.getDio);

  getItHelper.factory<DiaryService>(() => DiaryService(getIt<Dio>()));

  config.$initGetIt(getIt);
}
