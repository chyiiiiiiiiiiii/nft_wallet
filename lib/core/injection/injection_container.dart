import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../initialization.dart';
import '../api_service/api_service.dart';
import '../api_service/cookie_jar_manager.dart';
import '../network/network_connection.dart';
import 'begin/begin_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  logger.d('initInjection()');
  //! Core
  getIt.registerLazySingleton<NetworkConnection>(() => NetworkConnectionImpl());

  //! Data
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  //! Http Service
  getIt.registerLazySingleton<CookieJarManager>(() => CookieJarManager());
  getIt.registerLazySingleton<ApiService>(() => ApiService(cookieJarManager: getIt()));

  //! Page
  BeginInjection.init();
}
