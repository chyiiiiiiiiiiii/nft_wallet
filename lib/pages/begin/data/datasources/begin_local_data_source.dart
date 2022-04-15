import 'package:shared_preferences/shared_preferences.dart';

abstract class BeginLocalDataSource {
  // Future<NumberTriviaModel> getLastNumberTrivia();

  // Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class BeginLocalDataSourceImpl implements BeginLocalDataSource {
  final SharedPreferences sharedPreferences;

  BeginLocalDataSourceImpl({required this.sharedPreferences});

  // @override
  // Future<NumberTriviaModel> getLastNumberTrivia() {
  //   final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
  //   if (jsonString != null) {
  //     return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw CacheException();
  //   }
  // }

  // @override
  // Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
  //   return sharedPreferences.setString(
  //     CACHED_NUMBER_TRIVIA,
  //     json.encode(triviaToCache.toJson()),
  //   );
  // }
}
