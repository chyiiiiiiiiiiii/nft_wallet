import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkConnection {
  Future<bool> isConnected();
}

class NetworkConnectionImpl extends NetworkConnection {
  StreamSubscription? subscription;

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkInternet() async {
    if (await isConnected()) {
      return true;
    } else {
      return false;
    }
  }

  void startListeningStatus(Function(bool isConnected) onChanged) {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        onChanged(true);
      } else {
        onChanged(false);
      }
    });
  }

  void stopListeningStatus() {
    subscription?.cancel();
  }
}
