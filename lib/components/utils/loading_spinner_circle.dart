import 'package:flutter/material.dart';

class LoadingSpinningCircle extends StatelessWidget {
  LoadingSpinningCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
    );
  }
}
