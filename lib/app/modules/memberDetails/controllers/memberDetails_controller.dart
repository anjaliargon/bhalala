import 'package:bhalala/app/data/Model/basicModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/MemberCount.dart';
import '../../../routes/app_pages.dart';
import '../Model/MemberDetailsModel.dart';

class MemberDetailsController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var villageId = Get.arguments;
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
      var result = await ApiProvider().memberDetailsCount(villageId);
      if (!result.data.isNull) {
        Get.toNamed(Routes.MEMBER);
        getmemberDetailsData.value = result;
        isLoading(true);
      } else {
        Get.back();
        Fluttertoast.showToast(
            msg: "કોઈ સભ્ય મળ્યું નથી",
            backgroundColor: Colors.white,
            textColor: Colors.black);
        isLoading(false);
      }
      // if (getmemberDetailsData.value.status == 1) {
      //   var result =  getmemberDetailsData.value;
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Wrong credential",
      //       backgroundColor: Colors.white,
      //       textColor: Colors.black);
      //   isLoading(false);
      // }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
