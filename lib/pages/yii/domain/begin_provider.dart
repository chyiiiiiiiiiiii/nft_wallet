import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/injection/injection_container.dart';
import '../data/freezed/user_state.dart';
import '../data/models/user.dart';
import 'repositories/begin_repository.dart';

class BeginChangeNotifier extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> getUser(int userId) async {
    BeginRepository repository = getIt();
    _user = await repository.getUserData(userId);

    notifyListeners();
  }

  AsyncValue<User?> _user2 = const AsyncValue.loading();
  AsyncValue<User?> get user2 => _user2;

  Future<void> getUser2(int userId) async {
    BeginRepository repository = getIt();

    _user2 = const AsyncValue.loading();
    User? newData = await repository.getUserData(userId);
    _user2 = AsyncValue.data(newData);

    notifyListeners();
  }
}

ChangeNotifierProvider<BeginChangeNotifier> beginChangeProvider =
    ChangeNotifierProvider<BeginChangeNotifier>((ref) => BeginChangeNotifier());

//----------------------------------------------------------------

class BeginStateNotifier extends StateNotifier<UserState> {
  BeginStateNotifier() : super(const UserState.initial());

  BeginRepository repository = getIt();

  Future<void> getUser(int userId) async {
    state = const UserState.loading();

    try {
      final User user = await repository.getUserData(userId);
      state = UserState.data(user: user);
    } catch (e) {
      state = UserState.error(msg: e.toString());
    }
  }
}

final StateNotifierProvider<BeginStateNotifier, UserState> user3Provider = StateNotifierProvider<BeginStateNotifier, UserState>((ref) {
  return BeginStateNotifier();
});

//----------------------------------------------------------------

final FutureProvider<User?> user4Provider = FutureProvider<User?>((ref) async {
  BeginRepository repository = getIt();
  return await repository.getUserData(Random().nextInt(10));
});
