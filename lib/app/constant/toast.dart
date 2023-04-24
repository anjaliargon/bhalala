import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showBottomLongToast(String value) {
  Fluttertoast.showToast(
      backgroundColor: Colors.white,
      msg: value,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1);
}

Future<void> dismissKeyboard(BuildContext context) async =>
    FocusScope.of(context).unfocus();
