import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/Api/ApiProvider.dart';
import '../../../routes/app_pages.dart';

import '../Model/FamilyMemberModel.dart';

class FamilyMemberController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var memeberId = Get.arguments;
  final familyMemberData = FamilyMember().obs;

  @override
  void onInit() {
    getFamilymemberCount();
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

  void makeUrlRequest() {

  }
  Future<void> getFamilymemberCount() async {
    isLoading(true);
    errorOccurred(false);
    try {
      var result = await ApiProvider().FamilymemberDetails(memeberId);
      if (!result.data.isNull) {
        Get.toNamed(Routes.FAMILYMEMBER);
        familyMemberData.value = result;
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
