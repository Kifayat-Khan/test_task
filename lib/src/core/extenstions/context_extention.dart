import 'package:flutter/material.dart';

extension Context on BuildContext {
  double width(double factor) {
    return MediaQuery.sizeOf(this).width * factor;
  }

  double height(double factor) {
    return MediaQuery.sizeOf(this).height * factor;
  }
}
