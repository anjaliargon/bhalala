import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../model/ForgotModel.dart';

class ForgotControllerController extends GetxController {
  //TODO: Implement ForgotControllerController
  Rx<TextEditingController> forgotemailController = TextEditingController().obs;
  var isLoading = false.obs;
  final forgotData = ForgotPassword().obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  forgotpassword(String email) async {
    isLoading(false);
    var result = await ApiProvider().forgot(email);
    if (result.status == 1) {
      Fluttertoast.showToast(
          msg: result.message.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(true);
      return true;
    } else if (result.status == 2) {
      Fluttertoast.showToast(
          msg: result.message.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(true);
      return true;
    } else if (result.status == 3) {
      Fluttertoast.showToast(
          msg: result.message.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(true);
      return true;
    } else {
      isLoading(false);
      return true;
    }
  }
}
