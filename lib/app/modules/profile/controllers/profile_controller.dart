import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';

import '../model/profileModel.dart';

class ProfileController extends GetxController {
  final userProfileData = Profilemodel().obs;
  Map<String, dynamic> data = RxMap();
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  ProfileData? profileDat;

  @override
  void onInit() {
    userProfile();
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

  userProfile() async {
    isLoading(true);
    try {
      var result = await ApiProvider().Userprofile();
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
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
