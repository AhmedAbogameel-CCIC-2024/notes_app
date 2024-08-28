import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double height(double value) {
    final height = MediaQuery.of(this).size.height;
    return height / value;
  }

  double width(double value) {
    final width = MediaQuery.of(this).size.width;
    return width / value;
  }
}