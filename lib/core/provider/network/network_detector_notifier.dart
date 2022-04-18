import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../initialization.dart';

enum NetworkStatus {
  none,
  on,
  off,
}

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  static const String tag = "NetworkDetectorNotifier";

  final StreamController<ConnectivityResult> controller = StreamController<ConnectivityResult>();

  late NetworkStatus lastResult;

  NetworkDetectorNotifier() : super(NetworkStatus.none) {
    logger.d("$tag - init");

    lastResult = NetworkStatus.none;

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      NetworkStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        default:
          newState = NetworkStatus.off;
          break;
      }

      logger.d("$tag - NetworkStatus - $newState");

      if (newState != state) {
        state = newState;
      }
    });
  }
}
