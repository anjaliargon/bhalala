import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../network/controller/network_controller.dart';
import '../../../widget/temp2.dart';
import '../controllers/signUp_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignUpController());
    final NetworkController _networkController = Get.put(NetworkController());
    MyColor colors = MyColor();
    String? industry;
    String? education;
    String? bloodgroup;
    String? village;
    String? currentcity;
    String? status;
    String? membercount;
    return GetBuilder<SignUpController>(
        init: signupController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                StringConstant.registration,
                style: TextStyle(
                    color: colors.darkbrown,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Obx(
                () => Form(
                  key: controller.formKey.value,
                  child: Column(
                    children: [
                      CustomeTextFields(
                        iconfat: FontAwesomeIcons.a,
                        keyboard: 0,
                        hint: StringConstant.name,
                        validation: true,
                        fieldValue: controller.nameController,
                      ),
                      customTextField(
                          hintText: StringConstant.name,
                          iconfat: FontAwesomeIcons.solidCircleUser,
                          controller: controller.nameController),
                      customTextField(
                        hintText: StringConstant.fathername,
                        iconfat: FontAwesomeIcons.solidCircleUser,
                        controller: controller.fatherController,
                        validator: (father) {
                          controller.fatherValid.value = '';
                          if (father!.isEmpty) {
                            controller.fatherValid.value =
                                StringConstant.errorfathername;
                          }
                          // loginController.update();
                          return null;
                        },
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
                                      groupValue:
                                          controller.selectedsurname.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedSurname(value);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(StringConstant.bhalal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Radio(
                                      value: "bhalala",
                                      groupValue:
                                          controller.selectedsurname.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedSurname(value);
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
                                      value: StringConstant.women,
                                      groupValue:
                                          controller.selectedgender.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedGender(value);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(StringConstant.women),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Radio(
                                      value: StringConstant.gentelmen,
                                      groupValue:
                                          controller.selectedgender.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedGender(value);
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
                      SizedBox(
                        height: 1.h,
                      ),
                      customTextField(
                        hintText: StringConstant.Address,
                        iconfat: FontAwesomeIcons.home,
                        controller: controller.addressController,
                      ),
                      customTextField(
                        hintText: StringConstant.birthdaydate,
                        iconfat: FontAwesomeIcons.cakeCandles,
                        controller: controller.birthController,
                        iconButton: IconButton(
                            onPressed: () {
                              controller.datePick(context: context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ),
                      customTextField(
                        hintText: StringConstant.emailId,
                        iconfat: FontAwesomeIcons.solidEnvelope,
                        controller: controller.emailController,
                        validator: (email) {
                          controller.emailValid.value = '';
                          if (email!.isEmpty) {
                            controller.emailValid.value =
                                StringConstant.errorfathername;
                          }
                          // loginController.update();
                          return null;
                        },
                      ),
                      customTextField(
                        hintText: StringConstant.password,
                        iconfat: FontAwesomeIcons.lock,
                        controller: controller.passwordController,
                        validator: (password) {
                          controller.passwordValid.value = '';
                          if (password!.isEmpty) {
                            controller.passwordValid.value =
                                StringConstant.emailId;
                          }
                          // loginController.update();
                          return null;
                        },
                      ),
                      customTextField(
                        hintText: StringConstant.mobile,
                        iconfat: FontAwesomeIcons.mobileScreen,
                        controller: controller.mobileController,
                        validator: (mobile) {
                          controller.mobileValid.value = '';
                          if (mobile!.isEmpty) {
                            controller.mobileValid.value =
                                StringConstant.errorfathername;
                          }
                          // loginController.update();
                          return null;
                        },
                      ),
                      //// Industrial
                      customeDropDown(
                        iconfat: FontAwesomeIcons.graduationCap,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.workdetails),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            industry = newvalue!;
                            controller.industryController.text = newvalue;
                            controller.update();
                          },
                          value: industry,
                          items: controller.accountIndustryListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
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
                                        fontSize: 10.sp,
                                        color: colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Radio(
                                      value: StringConstant.job,
                                      groupValue: controller.selectedwork.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedWork(value);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(StringConstant.job),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Radio(
                                      value: StringConstant.buissness,
                                      groupValue: controller.selectedwork.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedWork(value);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(StringConstant.buissness),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Radio(
                                      value: StringConstant.other,
                                      groupValue: controller.selectedwork.value,
                                      activeColor: colors.darkbrown,
                                      onChanged: (value) {
                                        controller.onChnagedWork(value);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(StringConstant.other),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      customTextField(
                          hintText: StringConstant.work_details,
                          iconfat: FontAwesomeIcons.shop,
                          controller: controller.workController),
                      customeDropDown(
                        iconfat: FontAwesomeIcons.userGroup,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.parivar_membercount),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            membercount = newvalue!;
                            controller.memberController.text = newvalue;
                            controller.update();
                          },
                          value: membercount,
                          items: controller.dropdownListfamilycount
                              .map((selected) {
                            return DropdownMenuItem(
                              value: selected,
                              child: Text(
                                selected,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // Education..........
                      customeDropDown(
                        iconfat: FontAwesomeIcons.userGroup,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.education_chooes),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            education = newvalue!;
                            controller.educationController.text = newvalue;
                            controller.update();
                          },
                          value: education,
                          items: controller.accountEducationListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      //........Blood Group
                      customeDropDown(
                        iconfat: FontAwesomeIcons.person,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.bloodgroup_chooes),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            bloodgroup = newvalue!;
                            controller.bloodController.text = newvalue;
                            controller.update();
                          },
                          value: bloodgroup,
                          items: controller.accountBloodListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      customeDropDown(
                        iconfat: FontAwesomeIcons.locationDot,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.villagegroup),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            village = newvalue!;
                            controller.villageController.text = newvalue;
                            controller.update();
                          },
                          value: village,
                          items: controller.accountVillageListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      customeDropDown(
                        iconfat: FontAwesomeIcons.userGroup,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.currentcity),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            currentcity = newvalue!;
                            controller.currentCityController.text = newvalue;
                            controller.update();
                          },
                          value: currentcity,
                          items: controller.accountCurrentCityListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      customeDropDown(
                        iconfat: FontAwesomeIcons.userGroup,
                        dropdown: DropdownButton(
                          hint: Text(StringConstant.merriage),
                          isExpanded: true,
                          elevation: 0,
                          underline: Container(
                            color: colors.white,
                          ),
                          onChanged: (String? newvalue) {
                            status = newvalue!;
                            controller.statusController.text = newvalue;
                            controller.update();
                          },
                          value: status,
                          items: controller.accountStatusListData
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              children: [
                                Text(
                                  StringConstant.addidproof,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colors.grey,
                                      fontSize: 12.sp),
                                ),
                                Text(
                                  StringConstant.addidproof_details,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colors.grey,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {
                                _openDilogue(context: context);
                              },
                              child: Container(
                                height: 10.h,
                                width: 25.w,
                                child: (controller.selectedImg != null)
                                    ? Image.file(controller.selectedImg!.value,
                                        fit: BoxFit.cover)
                                    : Icon(
                                        Icons.photo_size_select_actual_outlined,
                                        size: 60.sp,
                                        color: colors.darkbrown,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_networkController.connectionStatus.value == 1 ||
                              _networkController.connectionStatus.value == 2) {
                            if (controller.formKey.value.currentState!
                                .validate()) {
                              var isCreateTask =
                                  await controller.userRegistration(
                                controller.nameController.text,
                                controller.fatherController.text,
                                controller.selectedsurname.value,
                                controller.selectedgender.value,
                                controller.addressController.text,
                                controller.birthController.text,
                                controller.emailController.text,
                                controller.passwordController.text,
                                controller.mobileController.text,
                                controller.industryController.text,
                                controller.selectedwork.value,
                                controller.workController.text,
                                controller.memberController.text,
                                controller.educationController.text,
                                controller.bloodController.text,
                                controller.villageController.text,
                                controller.currentCityController.text,
                                controller.statusController.text,
                              );
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                                textColor: colors.black,
                                backgroundColor: colors.white);
                          }
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
                ),
              ),
            ),
          );
        });
  }

  _openDilogue({required BuildContext context}) {
    MyColor colors = MyColor();
    return Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                controller.pickImagefromCamara();
                Get.back();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      height: 60,
                      child: Icon(
                        Icons.camera,
                        color: colors.darkbrown,
                        size: 60,
                      )),
                  // Space.height(10),
                  const Text(
                    "Camera",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: () async {
                controller.pickImagefromGallary();
                Get.back();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: colors.darkbrown,
                      size: 60,
                    ),
                  ),
                  // Space.height(10),
                  const Text(
                    "Gallery",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
