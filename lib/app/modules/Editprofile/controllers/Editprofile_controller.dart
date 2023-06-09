import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bhalala/app/constant/toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/basicModel.dart';
import '../../memberDetails/Model/MemberDetailsModel.dart';
import '../../profile/model/profileModel.dart';
import '../model.dart';

class EditProfileController extends GetxController {
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final usereditProfile = Editmodel().obs;
  var isLoadingDustry = false.obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  ProfileData? profileData;
  RxList<String> industriesData = <String>[].obs;
  RxList<IndustrieslistBasic> accountIndustryListData =
      RxList<IndustrieslistBasic>([]);
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

  onChnagedSurname(var surname) {
    selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    selectedwork.value = work;
  }

  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.arguments != null) {
        profileData = Get.arguments[ArgumentConstant.editprofiledata];
      }
      getAccountIndustryList();
      getAccountEducationList();
      getAccountStausList();
      getAccountBloodList();
      assignProfileData();
      getAccountVillageList();
      getAccountCurentCityList();
    });
  }

  userProfilePatchList(
    user_profile,
    user_name,
    mname,
    lname,
    birthdate,
    gender,
    address,
    user_email,
    mobile,
    inductries,
    work,
    work_details,
    education_id,
    blood,
    village,
    curent_city,
    status,
  ) async {
    isLoading.value = false;
    IndustrieslistBasic industrialData = accountIndustryListData.where((p0) => p0.name == inductries).first;
    var result = await ApiProvider().editprofile(
        user_profile,
        user_name,
        mname,
        lname,
        birthdate,
        gender,
        address,
        user_email,
        mobile,
        industrialData.id.toString(),
        work,
        work_details,
        education_id,
        blood,
        village,
        curent_city,
        status);
    if (result.status == 1) {
      usereditProfile.value = result;
      showBottomLongToast(result.message.toString());
      // Get.back();
      isLoading(true);
      return true;
    } else if (result.status == 2) {
      showBottomLongToast(result.message.toString());
      isLoading(true);
      return true;
    } else {
      isLoading(false);
      return true;
    }
  }

  Future<void> getAccountIndustryList() async {
    accountIndustryListData.clear();
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountIndustryListData.value = result.industrieslist!;
      for (var element in result.industrieslist!) {
        accountEducationListData.add(element.name.toString());
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
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
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
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
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
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
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
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
  Future<void> getAccountVillageList() async {
    accountVillageListData.clear();
    accountVillageListData.add(StringConstant.villagegroup);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.village!) {
        accountVillageListData.add(element.vName.toString());
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
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
        isLoadingDustry(true);
      }
    } else {
      isLoadingDustry(false);
    }
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

  Future<void> assignProfileData() async {
    await Future.delayed(const Duration(milliseconds: 2), () {
      nameController.text = profileData?.name ?? '';
      fatherController.text = profileData?.middleName ?? '';
      birthController.text = profileData?.birthdate ?? '';
      addressController.text = profileData?.address ?? '';
      emailController.text = profileData?.emailed ?? '';
      mobileController.text = profileData?.mobileNo ?? '';
      workController.text = profileData?.business ?? '';
      educationController.text = profileData?.educationId ?? '';
      bloodController.text = profileData?.bName ?? '';
      selectedgender.value = profileData?.gender ?? '';
      selectedsurname.value = profileData?.lastName ?? '';
      selectedwork.value = profileData?.busiType ?? '';
      industryController.text = profileData?.industryName ?? '';
      educationController.text = profileData?.educationId ?? '';
      bloodController.text = profileData?.bName ?? '';
      villageController.text = profileData?.vId ?? '';
      currentCityController.text = profileData?.homeId ?? '';
      statusController.text = profileData?.marriedId ?? '';
      isLoading(false);
    });
  }
}
