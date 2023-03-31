
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../routes/app_pages.dart';
import '../model/profileModel.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userLastName = ''.obs;
  RxString usermiddle = ''.obs;
  RxString userId = ''.obs;
  final userProfileData = Profilemodel().obs;
  Map<String, dynamic> data = RxMap();
  var isLoading = false.obs;

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

  // Userprofile(userId) async {
  //   var result = await ApiProvider().Userprofile(userId);
  //   if (result.status == 1) {
  //     userProfileData.value = result;
  //     Get.toNamed(Routes.PROFILE);
  //     isLoading(true);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Wrong credential",
  //         backgroundColor: Colors.white,
  //         textColor: Colors.black);
  //     isLoading(false);
  //
  //     userName.value = (await box.read("UserFirstname"));
  //     usermiddle.value = (await box.read("Usermiddlename"));
  //     userLastName.value = (await box.read("Userlastname"));
  //     userEmail.value = (await box.read("emailid"));
  //     userId.value = (await box.read("emailid"));
  //   }
  // }
  userProfile(userId) async {
    isLoading(true);
    try {
      var result = await ApiProvider().Userprofile(userId);
      if (result.status == 1) {
        userProfileData.value = result;
        isLoading(true);
      } else {
        Fluttertoast.showToast(
            msg: "Wrong credential",
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
    } finally {
      isLoading(false);
    }
  }
}