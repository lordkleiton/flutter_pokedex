import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  LoadingIndicatorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
    );
  }
}
