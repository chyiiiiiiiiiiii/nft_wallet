import 'package:dio/dio.dart';

import '../../pages/begin/data/models/user.dart';
import '../error/exceptions.dart';
import 'api_service.dart';

class RequestApi {
  final ApiService apiService;

  RequestApi({required this.apiService});

  Future<User> getUserData(int uid) async {
    try {
      final Response response = await apiService.dioRequest(
        "GET",
        'https://reqres.in/api/users/$uid',
      );

      int statusCode = response.statusCode ?? 0;

      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        return user;
      } else {
        throw ServerException(errorCode: statusCode);
      }
    } catch (e) {
      throw ServerException(errorCode: 999);
    }
  }
}
