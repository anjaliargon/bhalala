import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showBottomLongToast(String value) {
  Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1);
}

Future<void> dismissKeyboard(BuildContext context) async =>
    FocusScope.of(context).unfocus();