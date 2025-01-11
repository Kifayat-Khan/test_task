import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

appToast(
  String message, [
  bool isError = false,
]) {
  Color textColor = isError ? AppPallet.failureColor : AppPallet.successColor;
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 8,
      // backgroundColor: Colors.red,
      textColor: textColor,
      fontSize: 16.0);
}
