import '../../../../core/api_service/request_api.dart';
import '../models/user.dart';

abstract class BeginRemoteDataSource {
  Future<User> getUserData(int uid);
}

class BeginRemoteDataSourceImpl implements BeginRemoteDataSource {
  final RequestApi requestApi;

  BeginRemoteDataSourceImpl({required this.requestApi});

  @override
  Future<User> getUserData(int uid) async {
    return requestApi.getUserData(uid);
  }
}
