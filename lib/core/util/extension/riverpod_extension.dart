import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension AsyncValueUI on AsyncValue {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading;

  // show a snackbar on error only
  void showMessageOnError() => whenOrNull(
        error: (error, _) {
          Fluttertoast.showToast(msg: error.toString());
        },
      );
}
