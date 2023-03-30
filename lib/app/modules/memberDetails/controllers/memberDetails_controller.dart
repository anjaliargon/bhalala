import 'package:bhalala/app/data/Model/basicModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/MemberCount.dart';
import '../Model/MemberDetailsModel.dart';

class MemberDetailsController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var villageId = Get.arguments[0];
  final getmemberDetailsData = MemberDetails().obs;

  @override
  void onInit() {
    getAccountmemberCount();
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

  Future<void> getAccountmemberCount() async {
    isLoading(true);
    errorOccurred(false);
    try {
      getmemberDetailsData.value = await ApiProvider().memberDetailsCount(villageId);
      if (getmemberDetailsData.value.status == 1) {
        var result =  getmemberDetailsData.value;
      } else {
        Fluttertoast.showToast(
            msg: "Wrong credential",
            backgroundColor: Colors.white,
            textColor: Colors.black);
        isLoading(false);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
