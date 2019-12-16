import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(),
      height: 30,
      width: 30,
    );
  }
}
