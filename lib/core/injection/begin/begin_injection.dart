import '../../../pages/begin/data/datasources/begin_local_data_source.dart';
import '../../../pages/begin/data/datasources/begin_remote_data_source.dart';
import '../../../pages/begin/data/repositories/begin_repository_impl.dart';
import '../../../pages/begin/domain/repositories/begin_repository.dart';
import '../../api_service/request_api.dart';
import '../injection_container.dart';

class BeginInjection {
  static void init() {
    //! Repository
    getIt.registerLazySingleton<BeginRepository>(
      () => BeginRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkConnection: getIt(),
      ),
    );

    //! Api
    getIt.registerLazySingleton<RequestApi>(
      () => RequestApi(apiService: getIt()),
    );

    //! DataSource
    getIt.registerLazySingleton<BeginRemoteDataSource>(
      () => BeginRemoteDataSourceImpl(requestApi: getIt()),
    );
    getIt.registerLazySingleton<BeginLocalDataSource>(
      () => BeginLocalDataSourceImpl(sharedPreferences: getIt()),
    );
  }
}
