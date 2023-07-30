import 'package:get_it/get_it.dart';
import 'package:oop_example/controller/http/provider/dio_http_provider.dart';

import '../http/http_service.dart';
import '../http/provider/http_provider.dart';

final serviceLocator = GetIt.instance;

void setUpLocators() {
  serviceLocator.registerLazySingleton(() => HTTPService(httpProvider: HTTPProvider()));
}
