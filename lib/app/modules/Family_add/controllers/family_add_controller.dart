import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhalala/app/constant/toast.dart';
import '../../../data/Api/ApiProvider.dart';
import '../model/familyAddmodel.dart';
import '../model/verifyUserModel.dart';

class FamilyAddController extends GetxController {
  //TODO: Implement FamilyAddController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final count = 0.obs;
  Rx<statusCheck>  checkstatus = statusCheck().obs;
  final verify = verifyUser().obs;
  @override
  void onInit() {
    users();
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

  verifyAccount(String ids, var status) async {
    var result = await ApiProvider().verifyUserfamily(ids,status);
    if (result.status == 1) {
      verify.value = result;
      users();
      showBottomLongToast(result.data.toString());
    } else {
      print("NotFound");
    }
  }
  Future<void> users() async {
    isLoading(true);
    errorOccurred(false);
    try {
      checkstatus.value = await ApiProvider().statuscheck();


    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
  void increment() => count.value++;
}
