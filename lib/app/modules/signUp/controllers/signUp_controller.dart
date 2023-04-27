import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../data/Api/ApiProvider.dart';

import '../../../data/Model/basicModel.dart';
import '../../../widget/temp2.dart';
import '../model/signUp_model.dart';

class SignUpController extends GetxController {
  //TODO: Implement HomeController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<GlobalKey<FormState>> familyformKey = GlobalKey<FormState>().obs;
  final userRegistrationData = userRegistrationModel().obs;
  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  bool isLoaderVisible = false;
  RxList<String> industriesData = <String>[].obs;
  RxList<IndustrieslistBasic> accountIndustryListData =
  RxList<IndustrieslistBasic>([]);
  RxList<String> accountEducationListData = <String>[].obs;
  RxList<String> accountBloodListData = <String>[].obs;
  RxList<VillageBasic> accountVillageListData = RxList<VillageBasic>([]);
  RxList<String> accountCurrentCityListData = <String>[].obs;
  RxList<String> accountStatusListData = <String>[].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
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
  RxList<String> f_industriesData = <String>[].obs;
  RxList<IndustrieslistBasic> f_accountIndustryListData =
  RxList<IndustrieslistBasic>([]);
  RxList<String> f_accountEducationListData = <String>[].obs;
  RxList<String> f_accountBloodListData = <String>[].obs;
  RxList<VillageBasic> f_accountVillageListData = RxList<VillageBasic>([]);
  RxList<String> f_accountCurrentCityListData = <String>[].obs;
  RxList<String> f_accountStatusListData = <String>[].obs;
  TextEditingController f_nameController = TextEditingController();
  TextEditingController f_fatherController = TextEditingController();
  TextEditingController f_addressController = TextEditingController();
  TextEditingController f_emailController = TextEditingController();
  TextEditingController f_passwordController = TextEditingController();
  TextEditingController f_mobileController = TextEditingController();
  TextEditingController f_workController = TextEditingController();
  TextEditingController f_birthController = TextEditingController();
  TextEditingController f_industryController = TextEditingController();
  TextEditingController f_educationController = TextEditingController();
  TextEditingController f_memberController = TextEditingController();
  TextEditingController f_bloodController = TextEditingController();
  TextEditingController f_villageController = TextEditingController();
  TextEditingController f_currentCityController = TextEditingController();
  TextEditingController f_statusController = TextEditingController();
  RxString f_selectedsurname = "".obs;
  RxString f_selectedgender = "".obs;
  RxString f_selectedwork = "".obs;


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
      village_name,
      v_id,
      home_id,
      married_id,
      profilepic,
      // String?f_name,
      // String?f_fathername,
      // String?f_surname,
      // String?f_gender,
      // String?f_birthdate,
      // String?f_industrial,
      // String?f_busynesstype,
      // String?f_bussiness,
      // String?f_education,
      // String?f_blood,
      // String?f_status
      ) async {
    VillageBasic villageData =
        accountVillageListData.where((p0) => p0.vName == v_id).first;
    IndustrieslistBasic industrialData =
        accountIndustryListData.where((p0) => p0.name == industry_id).first;
    IndustrieslistBasic f_industrialData =
        accountIndustryListData.where((p0) => p0.name == industry_id).first;
    isLoading.value = false;
    // final  ageUser =("${DateTime.now().year}");
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
        industrialData.id.toString(),
        busi_type,
        business,
        no_of_member,
        education_id,
        b_name,
        village_name,
        villageData.vId.toString(),
        home_id,
        married_id,
        profilepic,
        // f_name,
        // f_fathername,
        // f_surname,
        // f_gender,
        // f_birthdate,
        // f_industrialData.id.toString(),
        // f_busynesstype,
        // f_bussiness,
        // f_education,
        // f_blood,
        // f_status
    );
    if (result.status == 1) {
      Fluttertoast.showToast(
          msg: result.message.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(true);
      return true;
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
  // DateTime currentDate = DateTime.now();
  // userAge(DateTime currentDate, DateTime birthController) {
  //
  //   Duration parse = currentDate.difference(birthController).abs();
  //   var age= "${parse.inDays~/360} Years ${((parse.inDays%360)~/30)} Month ${(parse.inDays%360)%30} Days";
  //   print(age);
  // }
  onChnagedSurname(var surname) {
    selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    selectedwork.value = work;
  }
  // openDilogueAddMember({required BuildContext context}) {
  //   String? f_industry;
  //   String? f_education;
  //   String? f_bloodgroup;
  //   String? f_status;
  //   MyColor colors = MyColor();
  //   Get.dialog(Dialog(
  //     child: SingleChildScrollView(
  //       child: Obx(()=>
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Form(
  //                 key: familyformKey.value,
  //                 child: Column(
  //                   children: [
  //                     SizedBox(
  //                       height: 1.h,
  //                     ),
  //                     CustomeTextFields(
  //                       iconfat: FontAwesomeIcons.solidCircleUser,
  //                       keyboard: 0,
  //                       hint: StringConstant.name,
  //                       validation: true,
  //                       fieldValue: f_nameController,
  //                     ),
  //                     CustomeTextFields(
  //                       iconfat: FontAwesomeIcons.solidCircleUser,
  //                       keyboard: 0,
  //                       hint: StringConstant.fathername,
  //                       validation: true,
  //                       fieldValue: f_fatherController,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           flex: 2,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(top: 15, left: 15),
  //                             child: FaIcon(FontAwesomeIcons.solidCircleUser,
  //                                 size: 20.sp, color: colors.darkbrown),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 8,
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(
  //                                   top: 10,
  //                                 ),
  //                                 child: Text(
  //                                   StringConstant.surname,
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12.sp,
  //                                       color: colors.grey),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: StringConstant.bhalal,
  //                                     groupValue: f_selectedsurname.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedSurname(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.bhalal),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: "Bhalala",
  //                                     groupValue: f_selectedsurname.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedSurname(value);
  //                                     }),
  //                               ),
  //                               const Padding(
  //                                 padding: EdgeInsets.only(top: 5),
  //                                 child: Text("Bhalala"),
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 1.h,
  //                     ),
  //
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           flex: 2,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(top: 15, left: 15),
  //                             child: FaIcon(FontAwesomeIcons.venusMars,
  //                                 size: 20.sp, color: colors.darkbrown),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 8,
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(
  //                                   top: 10,
  //                                 ),
  //                                 child: Text(
  //                                   StringConstant.gender,
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12.sp,
  //                                       color: colors.grey),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: "Women",
  //                                     groupValue: f_selectedgender.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedGender(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.women),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: "Male",
  //                                     groupValue: f_selectedgender.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedGender(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.gentelmen),
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     CustomeTextFields(
  //                       iconfat: FontAwesomeIcons.cakeCandles,
  //                       keyboard: 0,
  //                       hint: StringConstant.birthdaydate,
  //                       validation: true,
  //                       fieldValue: f_birthController,
  //                       icon: Icons.calendar_today_rounded,
  //                     ),
  //                     //// Industrial
  //                     Obx(
  //                           () => customeDropDown(
  //                         iconfat: FontAwesomeIcons.graduationCap,
  //                         dropdown: DropdownButton(
  //                           hint: Text(
  //                             StringConstant.work_sectorchoice,
  //                             style: TextStyle(
  //                                 color: colors.black, fontWeight: FontWeight.bold),
  //                           ),
  //                           isExpanded: true,
  //                           elevation: 0,
  //                           underline: Container(
  //                             color: colors.white,
  //                           ),
  //                           onChanged: (String? newvalue) {
  //                             f_industry = newvalue!;
  //                             f_industryController.text = newvalue;
  //                             update();
  //                           },
  //                           value: f_industry,
  //                           items: f_accountIndustryListData.map((items) {
  //                             return DropdownMenuItem(
  //                               value: items.name,
  //                               child: Text(
  //                                 items.name.toString(),
  //                                 style: TextStyle(
  //                                     fontSize: 10.sp, fontWeight: FontWeight.bold),
  //                               ),
  //                             );
  //                           }).toList(),
  //                         ),
  //                       ),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           flex: 2,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(top: 15, left: 15),
  //                             child: FaIcon(FontAwesomeIcons.solidCircleUser,
  //                                 size: 20.sp, color: colors.darkbrown),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 8,
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(
  //                                   top: 10,
  //                                 ),
  //                                 child: Text(
  //                                   StringConstant.work_details,
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 2.sp,
  //                                       color: colors.grey),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: StringConstant.job,
  //                                     groupValue: f_selectedwork.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedWork(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.job,
  //                                     style: TextStyle(fontSize: 4.sp)),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: StringConstant.buissness,
  //                                     groupValue: f_selectedwork.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedWork(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.buissness,
  //                                     style: TextStyle(fontSize: 4.sp)),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Radio(
  //                                     value: StringConstant.other,
  //                                     groupValue: f_selectedwork.value,
  //                                     activeColor: colors.darkbrown,
  //                                     onChanged: (value) {
  //                                       onChnagedWork(value);
  //                                     }),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 5),
  //                                 child: Text(StringConstant.other,
  //                                     style: TextStyle(fontSize: 10.sp)),
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     CustomeTextFields(
  //                       iconfat: FontAwesomeIcons.shop,
  //                       keyboard: 0,
  //                       hint: StringConstant.work_details,
  //                       validation: true,
  //                       fieldValue: f_workController,
  //                     ),
  //                     SizedBox(
  //                       height: 1.h,
  //                     ),
  //                     // Education..........
  //                     customeDropDown(
  //                       iconfat: FontAwesomeIcons.graduationCap,
  //                       dropdown: DropdownButton(
  //                         hint: Text(
  //                           StringConstant.education_chooes,
  //                           style: TextStyle(
  //                               color: colors.black, fontWeight: FontWeight.bold),
  //                         ),
  //                         isExpanded: true,
  //                         elevation: 0,
  //                         underline: Container(
  //                           color: colors.white,
  //                         ),
  //                         onChanged: (String? newvalue) {
  //                           f_education = newvalue!;
  //                           f_educationController.text = newvalue;
  //                           update();
  //                         },
  //                         value: f_education,
  //                         items: f_accountEducationListData.map((String items) {
  //                           return DropdownMenuItem(
  //                             value: items,
  //                             child: Text(
  //                               items,
  //                               style: TextStyle(
  //                                   fontSize: 10.sp, fontWeight: FontWeight.bold),
  //                             ),
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ),
  //                     //........Blood Group
  //                     customeDropDown(
  //                       iconfat: FontAwesomeIcons.person,
  //                       dropdown: DropdownButton(
  //                         hint: Text(
  //                           StringConstant.blood_chooes,
  //                           style: TextStyle(
  //                               color: colors.black, fontWeight: FontWeight.bold),
  //                         ),
  //                         isExpanded: true,
  //                         elevation: 0,
  //                         underline: Container(
  //                           color: colors.white,
  //                         ),
  //                         onChanged: (String? newvalue) {
  //                           f_bloodgroup = newvalue!;
  //                           f_bloodController.text = newvalue;
  //                           update();
  //                         },
  //                         value: f_bloodgroup,
  //                         items: f_accountBloodListData.map((String items) {
  //                           return DropdownMenuItem(
  //                             value: items,
  //                             child: Text(
  //                               items,
  //                               style: TextStyle(
  //                                   fontSize: 10.sp, fontWeight: FontWeight.bold),
  //                             ),
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ),
  //                     customeDropDown(
  //                       iconfat: FontAwesomeIcons.userGroup,
  //                       dropdown: DropdownButton(
  //                         hint: Text(
  //                           StringConstant.merriage,
  //                           style: TextStyle(
  //                               color: colors.black, fontWeight: FontWeight.bold),
  //                         ),
  //                         isExpanded: true,
  //                         elevation: 0,
  //                         underline: Container(
  //                           color: colors.white,
  //                         ),
  //                         onChanged: (String? newvalue) {
  //                           f_status = newvalue!;
  //                           f_statusController.text = newvalue;
  //                           update();
  //                         },
  //                         value: f_status,
  //                         items: f_accountStatusListData.map((String items) {
  //                           return DropdownMenuItem(
  //                             value: items,
  //                             child: Text(
  //                               items,
  //                               style: TextStyle(
  //                                   fontSize: 10.sp, fontWeight: FontWeight.bold),
  //                             ),
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 2.h,
  //                     ),
  //                     InkWell(
  //                       onTap: () async {
  //                         await  userRegistration(
  //                           nameController.text,
  //                           fatherController.text,
  //                           selectedsurname.value,
  //                           selectedgender.value,
  //                           addressController.text,
  //                           birthController.text,
  //                           emailController.text,
  //                           passwordController.text,
  //                           mobileController.text,
  //                           industryController.text,
  //                           selectedwork.value,
  //                           workController.text,
  //                           memberController.text,
  //                           educationController.text,
  //                           bloodController.text,
  //                           villageController.text,
  //                           villageController.text,
  //                           currentCityController.text,
  //                           statusController.text,
  //                           f_nameController.text,
  //                           f_fatherController.text,
  //                           f_selectedsurname.value,
  //                           f_selectedgender.value,
  //                           f_birthController.text,
  //                           f_industryController.text,
  //                           f_selectedwork.value,
  //                           f_workController.text,
  //                           f_educationController.text,
  //                           f_bloodController.text,
  //                           f_statusController.text
  //
  //
  //                         );
  //                       },
  //                       child: Container(
  //                         height: 6.h,
  //                         width: 90.w,
  //                         decoration: BoxDecoration(
  //                             color: colors.darkbrown,
  //                             borderRadius: BorderRadius.circular(10)),
  //                         child: Center(
  //                             child: Text(
  //                               StringConstant.registration,
  //                               style: TextStyle(
  //                                   color: colors.white,
  //                                   fontWeight: FontWeight.bold,
  //                                   fontSize: 13.sp),
  //                             )),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 2.h,
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           )
  //       ),
  //     ),
  //   ));
  // }
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
  getAccountVillageList() async {
    accountVillageListData.clear();
    isLoading.value = false;
    BasicModel result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountVillageListData.value = result.village!;
      isLoading(true);
      return true;
      // for (var element in result.village!) {
      //   accountVillageListData.add(element.vName.toString());
      //   isLoading(true);
      // }
    } else {
      isLoading(false);
      return true;
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
