import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../data/Api/ApiUrl.dart';
import '../../../data/Api/ApiProvider.dart';
import 'dart:convert';
import '../model/profileModel.dart';
import 'package:http/http.dart' as http;
class ProfileController extends GetxController {
  final userProfileData = Profilemodel().obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final userid = "".obs;
  RxList<Profilemodel> profiledata = <Profilemodel>[].obs;
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
  Future<Profilemodel> userProfile() async {
    await Future.delayed(Duration(seconds: 5));
    isLoading(true);
    try {
      var result = await ApiProvider().Userprofile();
      if (result.status == 1) {
        userProfileData.value = result;
      } else {
        Fluttertoast.showToast(
            msg: "Wrong credential",
            backgroundColor: Colors.white,
            textColor: Colors.black);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
    return userProfileData.value;
  }
  assigndata(){
    userid.value  =  userProfileData.value.data?.first.rId ??'';
  }
}
