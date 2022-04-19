import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> tabCurrentIndexProvider = StateProvider<int>((ref) {
  return 0;
});
