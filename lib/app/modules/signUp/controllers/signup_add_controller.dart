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
  final signucontroller = SignUpController();
  RxString f_selectedsurname = "".obs;
  RxString f_selectedgender = "".obs;
  RxString f_selectedwork = "".obs;
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
    f_selectedsurname.value = surname;
  }

  onChnagedGender(var gender) {
    f_selectedgender.value = gender;
  }

  onChnagedWork(var work) {
    f_selectedwork.value = work;
  }
  Future<void> getAccountIndustryList() async {
    f_accountIndustryListData.clear();
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      f_accountIndustryListData.value = result.industrieslist!;
    } else {
      isLoading(false);
    }
  }

  //.....Education
  Future<void> getAccountEducationList() async {
    f_accountEducationListData.clear();
    f_accountEducationListData.add(StringConstant.education_chooes);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.education!) {
        f_accountEducationListData.add(element.educationName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.......Blood
  Future<void> getAccountBloodList() async {
    f_accountBloodListData.clear();
    f_accountBloodListData.add(StringConstant.bloodgroup_chooes);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.bloodGroup!) {
        f_accountBloodListData.add(element.bName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  //.......Status
  Future<void> getAccountStausList() async {
    f_accountStatusListData.clear();
    f_accountStatusListData.add(StringConstant.merriage);
    var result = await ApiProvider().getBasicData();
    if (result.status == 1) {
      for (var element in result.married!) {
        f_accountStatusListData.add(element.marriedName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }
  openDilogueAddMember( {required BuildContext context,
    String?user_name,
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
    v_name,
    v_id,
    home_id,
    married_id,profilepic}) {
    String? fIndustry;
    String? fEducation;
    String? fBloodgroup;
    String? fStatus;
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
                      fieldValue: f_nameController,
                    ),
                    CustomeTextFields(
                      iconfat: FontAwesomeIcons.solidCircleUser,
                      keyboard: 0,
                      hint: StringConstant.fathername,
                      validation: true,
                      fieldValue: f_fatherController,
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
                                    groupValue: f_selectedsurname.value,
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
                                    groupValue: f_selectedsurname.value,
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
                                    groupValue: f_selectedgender.value,
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
                                    groupValue: f_selectedgender.value,
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
                      fieldValue: f_birthController,
                      icon: Icons.calendar_today_rounded,
                    ),
                    //// Industrial
                    Obx(
                      () => customeDropDown(
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
                              fIndustry = newvalue!;
                              f_industryController.text = newvalue;
                              update();
                            },
                            value: fIndustry,
                            items: f_accountIndustryListData.map((items) {
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
                                    groupValue: f_selectedwork.value,
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
                                    groupValue: f_selectedwork.value,
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
                                    groupValue: f_selectedwork.value,
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
                      fieldValue: f_workController,
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
                          fEducation = newvalue!;
                          f_educationController.text = newvalue;
                          update();
                        },
                        value: fEducation,
                        items: f_accountEducationListData.map((String items) {
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
                          fBloodgroup = newvalue!;
                          f_bloodController.text = newvalue;
                          update();
                        },
                        value: fBloodgroup,
                        items: f_accountBloodListData.map((String items) {
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
                          fStatus = newvalue!;
                          f_statusController.text = newvalue;
                          update();
                        },
                        value: fStatus,
                        items: f_accountStatusListData.map((String items) {
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
                            v_name,
                            v_id,
                            home_id,
                            married_id,
                          profilepic,
                          // f_nameController.text,
                          // f_fatherController.text,
                          // f_selectedsurname.value,
                          // f_selectedgender.value,
                          // f_birthController.text,
                          // f_industryController.text,
                          // f_selectedwork.value,
                          // f_workController.text,
                          // f_educationController.text,
                          // f_bloodController.text,
                          // f_statusController.text


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
          )
      ),
      ),
    ));
  }


}
