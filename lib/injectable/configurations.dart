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

  config.$initGetIt(getIt);
}
