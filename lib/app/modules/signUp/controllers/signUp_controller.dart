import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';

import '../../../routes/app_pages.dart';
import '../model/signUp_model.dart';

class SignUpController extends GetxController {
  //TODO: Implement HomeController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final userRegistrationData = userRegistrationModel().obs;
  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  bool isLoaderVisible = false;
  RxList<String> industriesData = <String>[].obs;
  RxList<String> accountIndustryListData = <String>[].obs;
  RxList<String> accountEducationListData = <String>[].obs;
  RxList<String> accountBloodListData = <String>[].obs;
  RxList<String> accountVillageListData = <String>[].obs;
  RxList<String> accountCurrentCityListData = <String>[].obs;
  RxList<String> accountStatusListData = <String>[].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController memberController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController currentCityController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  RxString selectedsurname = "".obs;
  RxString selectedgender = "".obs;
  RxString selectedwork = "".obs;
  RxString dropdownfamilycount = StringConstant.parivar_membercount.obs;
  Rx<File>? selectedImg;
  RxList<String> dropdownListfamilycount =
      <String>["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].obs;

  @override
  void onInit() {
    getAccountIndustryList();
    getAccountStausList();
    getAccountCurentCityList();
    getAccountVillageList();
    getAccountBloodList();
    getAccountEducationList();
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

  userRegistration(
      user_name,
      mname,
      lname,
      gender,
      address,
      birthdate,
      user_email,
      password,
      mobile_no,
      industry_id,
      busi_type,
      business,
      no_of_member,
      education_id,
      b_name,
      v_id,
      home_id,
      married_id) async {
    isLoading.value = false;
    var result = await ApiProvider().userRegistration(
        user_name,
        mname,
        lname,
        gender,
        address,
        birthdate,
        user_email,
        password,
        mobile_no,
        industry_id,
        busi_type,
        business,
        no_of_member,
        education_id,
        b_name,
        v_id,
        home_id,
        married_id);
    if (result.status == 1) {
      Fluttertoast.showToast(
          msg: result.message.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(true);
      return true;
      // Get.toNamed(Routes.HOME);
    } else if (result.status == 2) {
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

  onChnagedSurname(var surname) {
    selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    selectedwork.value = work;
  }

  void pickImagefromGallary() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
    if (image != null) {
      selectedImg = File(image.path).obs;
      selectedImg!.refresh();
      update();
    }
  }

  void pickImagefromCamara() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );
    if (image != null) {
      selectedImg = File(image.path).obs;
      selectedImg!.refresh();
      update();
    }
  }

  Future<void> getAccountIndustryList() async {
    accountIndustryListData.clear();
    accountIndustryListData.add(StringConstant.workdetails);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.industrieslist!) {
        accountIndustryListData.add(element.name.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.....Education
  Future<void> getAccountEducationList() async {
    accountEducationListData.clear();
    accountEducationListData.add(StringConstant.education_chooes);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.education!) {
        accountEducationListData.add(element.educationName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.......Blood
  Future<void> getAccountBloodList() async {
    accountBloodListData.clear();
    accountBloodListData.add(StringConstant.bloodgroup_chooes);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.bloodGroup!) {
        accountBloodListData.add(element.bName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.....village
  Future<void> getAccountVillageList() async {
    accountVillageListData.clear();
    accountVillageListData.add(StringConstant.villagegroup);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.village!) {
        accountVillageListData.add(element.vName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //......current city
  Future<void> getAccountCurentCityList() async {
    accountCurrentCityListData.clear();
    accountCurrentCityListData.add(StringConstant.currentcity);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.home!) {
        accountCurrentCityListData.add(element.homeName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.......Status
  Future<void> getAccountStausList() async {
    accountStatusListData.clear();
    accountStatusListData.add(StringConstant.merriage);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.married!) {
        accountStatusListData.add(element.marriedName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }
}
