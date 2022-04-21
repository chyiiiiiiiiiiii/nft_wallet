import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
    this.size = 48.0,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: Colors.white,
      size: size,
    );
  }
}
