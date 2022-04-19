import '../../data/models/user.dart';

abstract class BeginRepository {
  Future<User> getUserData(int uid);
}
