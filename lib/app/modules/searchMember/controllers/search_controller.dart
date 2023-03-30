import 'package:bhalala/app/modules/searchMember/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final searchData = SearchModel().obs;
  RxList<String> accountVillageListData = <String>[].obs;
  RxList<String> accountBloodListData = <String>[].obs;
  RxList<String> accountEducationListData = <String>[].obs;
  RxList<String> accountIndustryListData = <String>[].obs;
  RxList<String> accountHomeListData = <String>[].obs;
  TextEditingController industryController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController homeController = TextEditingController();

  @override
  void onInit() {
    getAccountVillageList();
    getAccountBloodList();
    getHomeList();
    getAccountEducationList();
    getAccountIndustryList();
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

  search(String village, String home,String industri,String education,String blood) async {
    var result = await ApiProvider().search(village,home,industri,education,blood);
    if (result.status == 1) {
      print(result.data?.length);
      searchData.value = result;
      isLoading(true);
    } else {
      Fluttertoast.showToast(
          msg: "No Data Found",
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(false);
    }
  }

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

  Future<void> getHomeList() async {
    accountHomeListData.clear();
    accountHomeListData.add(StringConstant.education_chooes);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.home!) {
        accountHomeListData.add(element.homeName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }
}
