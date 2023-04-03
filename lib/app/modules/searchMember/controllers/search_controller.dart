import 'package:bhalala/app/modules/searchMember/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/basicModel.dart';
import '../../../routes/app_pages.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final searchData = SearchModel().obs;
  RxList<VillageBasic> accountVillageListData = RxList<VillageBasic>([]);
  RxList<String> accountBloodListData = <String>[].obs;
  RxList<String> accountEducationListData = <String>[].obs;
  RxList<IndustrieslistBasic> accountIndustryListData =RxList<IndustrieslistBasic>([]);
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

  Future<void> search(String village, String home, String industri,
      String education, String blood) async {
    VillageBasic villageData =  accountVillageListData.where((p0) => p0.vName == village).first;
    IndustrieslistBasic industrialData =  accountIndustryListData.where((p0) => p0.name == industri).first;
    var result =
        await ApiProvider().search(villageData.vId.toString(), home, industrialData.id.toString(), education, blood);
    if (!result.data.isNull) {
      Get.toNamed(Routes.SEARCHMEMBER);
      print(result.data?.length);
      searchData.value = result;
    } else {
      Fluttertoast.showToast(
          msg: "કોઈ સભ્ય મળ્યું નથી",
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(false);
    }
  }

  Future<void> getAccountVillageList() async {
    accountVillageListData.clear();
    // accountVillageListData.add(StringConstant.villagegroup);
    BasicModel result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountVillageListData.value = result.village!;
      // for (var element in result.village!) {
      //   accountVillageListData.add(element.vName.toString());
      //   isLoading(true);
      // }
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
    // accountIndustryListData.add(StringConstant.workdetails);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountIndustryListData.value = result.industrieslist!;
      // for (var element in result.industrieslist!) {
      //   accountIndustryListData.add(element.name.toString());
      //   isLoading(true);
      // }
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
