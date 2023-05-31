import 'package:bhalala/app/constant/sizeConstant.dart';
import 'package:bhalala/app/modules/searchMember/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:bhalala/app/constant/toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/basicModel.dart';
import 'dart:convert';

import '../../../routes/app_pages.dart';

class searchController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final searchData = SearchModel().obs;
  RxList<VillageBasic> accountVillageListData = RxList<VillageBasic>([]);
  RxList<String> accountBloodListData = <String>[].obs;
  RxList<String> accountEducationListData = <String>[].obs;
  RxList<IndustrieslistBasic> accountIndustryListData =
      RxList<IndustrieslistBasic>([]);
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

  Future<SearchModel>  search() async {
    SearchModel searchmodel = SearchModel();
    String query = "http://3.111.29.34/webservice/search_member_all.php";
    IndustrieslistBasic? industrialData;
    VillageBasic? villageData;
    if (!isNullEmptyOrFalse(industryController.text)) {
      industrialData = accountIndustryListData
          .where((p0) => p0.name == industryController.text)
          .first;
    }
    if (!isNullEmptyOrFalse(villageController.text)) {
      villageData = accountVillageListData
          .where((p0) => p0.vName == villageController.text)
          .first;
    }
    var request = http.MultipartRequest('POST', Uri.parse(query));
    if (!isNullEmptyOrFalse(villageData?.vId ?? '') &&
        !isNullEmptyOrFalse(homeController.text) &&
        !isNullEmptyOrFalse(bloodController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    } else if (!isNullEmptyOrFalse(villageData?.vId ?? '')) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }else if (!isNullEmptyOrFalse(homeController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        // 'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }
    else if (!isNullEmptyOrFalse(villageData?.vId ?? '')) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }else if (!isNullEmptyOrFalse(bloodController.text)) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        // 'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }else if (!isNullEmptyOrFalse(educationController.text)) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        // 'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }else if (!isNullEmptyOrFalse(industrialData?.id.toString() ?? "")) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        // 'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        'busi_id': industrialData?.id.toString() ?? ""
      });
    }
    else if (!isNullEmptyOrFalse(villageData?.vId ?? '')) {
      request.fields.addAll({
        // 'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }
    else if (!isNullEmptyOrFalse(villageData?.vId ?? '') &&
        !isNullEmptyOrFalse(homeController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    } else if (isNullEmptyOrFalse(bloodController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        // 'blood_name': bloodController.text,
        'edu_name': educationController.text,
        'busi_id': industrialData?.id.toString() ?? ""
      });
    } else if (isNullEmptyOrFalse(industrialData?.id.toString() ?? "")) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    } else if (isNullEmptyOrFalse(educationController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        'busi_id': industrialData?.id.toString() ?? ""
      });
    } else if (isNullEmptyOrFalse(educationController.text) ||
        isNullEmptyOrFalse(industrialData?.id.toString() ?? "")) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        // 'edu_name': educationController.text,
        // 'busi_id': industrialData?.id.toString() ?? ""
      });
    }
    else if (!isNullEmptyOrFalse(bloodController.text) &&
        !isNullEmptyOrFalse(homeController.text) &&
        !isNullEmptyOrFalse(industrialData?.id.toString()) &&
        !isNullEmptyOrFalse(villageData?.vId.toString()) &&
        !isNullEmptyOrFalse(educationController.text)) {
      request.fields.addAll({
        'home_name': homeController.text,
        'village_id': villageData?.vId.toString() ?? "",
        'blood_name': bloodController.text,
        'edu_name': educationController.text,
        'busi_id': industrialData?.id.toString() ?? ""
      });
    }

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);

    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      if (data['status'] == 1) {
        searchData.value = SearchModel.fromJson(data);
        Get.toNamed(Routes.SEARCHMEMBER);
        print(searchmodel.data?.length);
      } else {
        showBottomLongToast("કોઈ સભ્ય મળ્યું નથી");
      }
    } else {
      print("error ${response1.reasonPhrase}");
    }
    return searchmodel;
  }

  // search(String? village, String home, String industri, String education, String blood) async {
  //   VillageBasic villageData = accountVillageListData.where((p0) => p0.vName == village).first;
  //   IndustrieslistBasic industrialData = accountIndustryListData.where((p0) => p0.name == industri).first;
  //   isLoading.value = false;
  //   var result = await ApiProvider().search(villageData.vId.toString(), home, industrialData.id.toString(), education, blood);
  //   if (!result.data.isNull) {
  //     Get.toNamed(Routes.SEARCHMEMBER);
  //     searchData.value = result;
  //     isLoading(true);
  //     return true;
  //   } else if (result.data.isNull) {
  //     Fluttertoast.showToast(
  //         msg: "કોઈ સભ્ય મળ્યું નથી",
  //         backgroundColor: Colors.white,
  //         textColor: Colors.black);
  //     isLoading(true);
  //     return true;
  //   } else {
  //     isLoading(false);
  //     return true;
  //   }
  // }
  conditioncheck() {}

  getAccountVillageList() async {
    accountVillageListData.clear();
    isLoading.value = false;
    BasicModel result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountVillageListData.value = result.village!;
      changePosition(accountVillageListData, 116, 16);
      isLoading(true);
      return true;
    } else {
      isLoading(false);
      return true;
    }
  }
  void changePosition(List list,int oldIndex, int newIndex) {
    if (oldIndex < 0 ||
        oldIndex >= list.length ||
        newIndex < 0 ||
        newIndex >= list.length) {
      return;
    }
    String item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

  }

  Future<void> getAccountBloodList() async {
    accountBloodListData.clear();
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
