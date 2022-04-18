import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user.dart';

abstract class BeginLocalDataSource {
  Future<User> getLastUserData();
  Future<void> cacheUser(User user);
}

class BeginLocalDataSourceImpl implements BeginLocalDataSource {
  final SharedPreferences sharedPreferences;

  String cacheKey = 'cache_user';

  BeginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<User> getLastUserData() {
    final jsonString = sharedPreferences.getString(cacheKey);
    if (jsonString != null) {
      return Future.value(User.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(User user) {
    return sharedPreferences.setString(
      cacheKey,
      json.encode(user.toJson()),
    );
  }
}
