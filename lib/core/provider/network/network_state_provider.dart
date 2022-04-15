import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_detector_notifier.dart';

final StateNotifierProvider<NetworkDetectorNotifier, NetworkStatus> networkStateProvider = StateNotifierProvider((ref) {
  return NetworkDetectorNotifier();
});
