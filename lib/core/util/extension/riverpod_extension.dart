import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension AsyncValueUI on AsyncValue {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading;

  // 在有錯誤狀態的時候觸發，顯示吐司條
  void showMessageOnError() => whenOrNull(
        error: (error, _) {
          Fluttertoast.showToast(msg: error.toString());
        },
      );
}
