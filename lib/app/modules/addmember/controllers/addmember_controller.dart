import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/basicModel.dart';

class AddmemberController extends GetxController {
  //TODO: Implement AddmemberController

  final count = 0.obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  RxList<String> industriesData = <String>[].obs;
  RxList<IndustrieslistBasic> accountIndustryListData =RxList<IndustrieslistBasic>([]);
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
  TextEditingController statusController = TextEditingController();RxString nameValid = ''.obs;
  RxString fatherValid = ''.obs;
  RxString addressValid = ''.obs;
  RxString emailValid = ''.obs;
  RxString passwordValid = ''.obs;
  RxString mobileValid = ''.obs;
  RxString workValid = ''.obs;
  RxString birthValid = ''.obs;
  RxString selectedsurname = "".obs;
  RxString selectedgender = "".obs;
  RxString selectedwork = "".obs;
  RxString dropdownfamilycount = StringConstant.parivar_membercount.obs;
  @override
  void onInit() {
    getAccountBloodList();
    getAccountStausList();
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
  onChnagedSurname(var surname) {
    selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    selectedwork.value = work;
  }
  datePick({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2033));
    if (pickedDate != null) {
      print(pickedDate);
      birthController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    } else {}
  }

  Future<void> getAccountIndustryList() async {
    accountIndustryListData.clear();
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountIndustryListData.value = result.industrieslist !;
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
  void increment() => count.value++;
}
