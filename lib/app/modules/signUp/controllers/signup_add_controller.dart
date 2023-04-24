import 'dart:io';

import 'package:bhalala/app/modules/signUp/controllers/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/basicModel.dart';
import '../../../widget/temp2.dart';

class SignupAddController extends GetxController {
  //TODO: Implement SignupAddController
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
  final signucontroller = SignUpController();
  RxString selectedsurname = "".obs;
  RxString selectedgender = "".obs;
  RxString selectedwork = "".obs;
  RxString dropdownfamilycount = StringConstant.parivar_membercount.obs;
  Rx<File>? selectedImg;
  RxList<String> dropdownListfamilycount =
      <String>["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].obs;
  Rx<GlobalKey<FormState>> familyformKey = GlobalKey<FormState>().obs;
  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    getAccountIndustryList();
    getAccountStausList();
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

  onChnagedSurname(var surname) {
    selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    selectedwork.value = work;
  }
  Future<void> getAccountIndustryList() async {
    accountIndustryListData.clear();
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      accountIndustryListData.value = result.industrieslist!;
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
  openDilogueAddMember({required BuildContext context}) {
    String? industry;
    String? education;
    String? bloodgroup;
    String? status;
    MyColor colors = MyColor();
    Get.dialog(Dialog(
      child: SingleChildScrollView(
        child: Obx(()=>
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: familyformKey.value,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomeTextFields(
                      iconfat: FontAwesomeIcons.solidCircleUser,
                      keyboard: 0,
                      hint: StringConstant.name,
                      validation: true,
                      fieldValue: fnameController,
                    ),
                    CustomeTextFields(
                      iconfat: FontAwesomeIcons.solidCircleUser,
                      keyboard: 0,
                      hint: StringConstant.fathername,
                      validation: true,
                      fieldValue: fatherController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: FaIcon(FontAwesomeIcons.solidCircleUser,
                                size: 20.sp, color: colors.darkbrown),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  StringConstant.surname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: StringConstant.bhalal,
                                    groupValue: selectedsurname.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedSurname(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.bhalal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: "Bhalala",
                                    groupValue: selectedsurname.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedSurname(value);
                                    }),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("Bhalala"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: FaIcon(FontAwesomeIcons.venusMars,
                                size: 20.sp, color: colors.darkbrown),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  StringConstant.gender,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: "Women",
                                    groupValue: selectedgender.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedGender(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.women),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: "Male",
                                    groupValue: selectedgender.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedGender(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.gentelmen),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomeTextFields(
                      iconfat: FontAwesomeIcons.cakeCandles,
                      keyboard: 0,
                      hint: StringConstant.birthdaydate,
                      validation: true,
                      fieldValue: birthController,
                      icon: Icons.calendar_today_rounded,
                    ),
                    //// Industrial
                    customeDropDown(
                      iconfat: FontAwesomeIcons.graduationCap,
                      dropdown: DropdownButton(
                        hint: Text(
                          StringConstant.work_sectorchoice,
                          style: TextStyle(
                              color: colors.black, fontWeight: FontWeight.bold),
                        ),
                        isExpanded: true,
                        elevation: 0,
                        underline: Container(
                          color: colors.white,
                        ),
                        onChanged: (String? newvalue) {
                          industry = newvalue!;
                          industryController.text = newvalue;
                          update();
                        },
                        value: industry,
                        items: accountIndustryListData.map((items) {
                          return DropdownMenuItem(
                            value: items.name,
                            child: Text(
                              items.name.toString(),
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: FaIcon(FontAwesomeIcons.solidCircleUser,
                                size: 20.sp, color: colors.darkbrown),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  StringConstant.work_details,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.sp,
                                      color: colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: StringConstant.job,
                                    groupValue: selectedwork.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedWork(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.job,
                                    style: TextStyle(fontSize: 4.sp)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: StringConstant.buissness,
                                    groupValue: selectedwork.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedWork(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.buissness,
                                    style: TextStyle(fontSize: 4.sp)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Radio(
                                    value: StringConstant.other,
                                    groupValue: selectedwork.value,
                                    activeColor: colors.darkbrown,
                                    onChanged: (value) {
                                      onChnagedWork(value);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(StringConstant.other,
                                    style: TextStyle(fontSize: 10.sp)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomeTextFields(
                      iconfat: FontAwesomeIcons.shop,
                      keyboard: 0,
                      hint: StringConstant.work_details,
                      validation: true,
                      fieldValue: workController,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    // Education..........
                    customeDropDown(
                      iconfat: FontAwesomeIcons.graduationCap,
                      dropdown: DropdownButton(
                        hint: Text(
                          StringConstant.education_chooes,
                          style: TextStyle(
                              color: colors.black, fontWeight: FontWeight.bold),
                        ),
                        isExpanded: true,
                        elevation: 0,
                        underline: Container(
                          color: colors.white,
                        ),
                        onChanged: (String? newvalue) {
                          education = newvalue!;
                          educationController.text = newvalue;
                          update();
                        },
                        value: education,
                        items: accountEducationListData.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    //........Blood Group
                    customeDropDown(
                      iconfat: FontAwesomeIcons.person,
                      dropdown: DropdownButton(
                        hint: Text(
                          StringConstant.blood_chooes,
                          style: TextStyle(
                              color: colors.black, fontWeight: FontWeight.bold),
                        ),
                        isExpanded: true,
                        elevation: 0,
                        underline: Container(
                          color: colors.white,
                        ),
                        onChanged: (String? newvalue) {
                          bloodgroup = newvalue!;
                          bloodController.text = newvalue;
                          update();
                        },
                        value: bloodgroup,
                        items: accountBloodListData.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    customeDropDown(
                      iconfat: FontAwesomeIcons.userGroup,
                      dropdown: DropdownButton(
                        hint: Text(
                          StringConstant.merriage,
                          style: TextStyle(
                              color: colors.black, fontWeight: FontWeight.bold),
                        ),
                        isExpanded: true,
                        elevation: 0,
                        underline: Container(
                          color: colors.white,
                        ),
                        onChanged: (String? newvalue) {
                          status = newvalue!;
                          statusController.text = newvalue;
                          update();
                        },
                        value: status,
                        items: accountStatusListData.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await  signucontroller.userRegistration(
                         signucontroller.nameController.text,
                          signucontroller.fatherController.text,
                          signucontroller.selectedsurname.value,
                          signucontroller.selectedgender.value,
                          signucontroller.addressController.text,
                          signucontroller.birthController.text,
                          signucontroller.emailController.text,
                          signucontroller.passwordController.text,
                          signucontroller.mobileController.text,
                          signucontroller.industryController.text,
                          signucontroller.selectedwork.value,
                          signucontroller.workController.text,
                          signucontroller.memberController.text,
                          signucontroller.educationController.text,
                          signucontroller.bloodController.text,
                          signucontroller.villageController.text,
                          signucontroller.villageController.text,
                          signucontroller.currentCityController.text,
                          signucontroller.statusController.text,
                        );
                      },
                      child: Container(
                        height: 6.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: colors.darkbrown,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          StringConstant.registration,
                          style: TextStyle(
                              color: colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }


}
