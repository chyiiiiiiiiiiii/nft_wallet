import '../../../../core/network/network_connection.dart';
import '../../domain/repositories/begin_repository.dart';
import '../datasources/begin_local_data_source.dart';
import '../datasources/begin_remote_data_source.dart';
import '../models/user.dart';

class BeginRepositoryImpl implements BeginRepository {
  final BeginRemoteDataSource remoteDataSource;
  final BeginLocalDataSource localDataSource;
  final NetworkConnection networkConnection;

  BeginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkConnection,
  });

  @override
  Future<User> getUserData(int uid) async {
    bool isConnected = await networkConnection.isConnected();
    if (isConnected) {
      final User data = await remoteDataSource.getUserData(uid);
      localDataSource.cacheUser(data);
      return data;
    } else {
      final User data = await localDataSource.getLastUserData();
      return data;
    }
  }

  // Future<NFTAttributes?> getTokenMetaData({required String uri}) async {
  //   final response = await Dio().get(uri);
  //   if (response.statusCode != 200) return null;
  //   final data = const JsonDecoder().convert(response.data);
  //   return NFTAttributes.fromJson(data);
  // }

}
