import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../constant/screens/loading_and_error_screen.dart';
import '../../../network/controller/network_controller.dart';
import '../../../widget/temp2.dart';
import '../controllers/addmember_controller.dart';

class AddmemberView extends GetView<AddmemberController> {
  AddmemberView({Key? key}) : super(key: key);
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    String? industry;
    String? education;
    String? bloodgroup;
    String? status;
    MyColor colors = MyColor();
    return GetBuilder<AddmemberController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: colors.darkbrown,
          title: Text(
            StringConstant.bhalalaparivar,
            style: TextStyle(
                color: colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: controller.formKey.value,
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
                    fieldValue: controller.nameController,
                  ),
                  CustomeTextFields(
                    iconfat: FontAwesomeIcons.solidCircleUser,
                    keyboard: 0,
                    hint: StringConstant.fathername,
                    validation: true,
                    fieldValue: controller.fatherController,
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
                                  groupValue: controller.selectedsurname.value,
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
                                  value: "Bhalala",
                                  groupValue: controller.selectedsurname.value,
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
                                  value: "Women",
                                  groupValue: controller.selectedgender.value,
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
                                  value: "Male",
                                  groupValue: controller.selectedgender.value,
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
                  CustomeTextFields(
                    iconfat: FontAwesomeIcons.cakeCandles,
                    keyboard: 0,
                    hint: StringConstant.birthdaydate,
                    validation: true,
                    fieldValue: controller.birthController,
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
                        controller.industryController.text = newvalue;
                        controller.update();
                      },
                      value: industry,
                      items: controller.accountIndustryListData.map((items) {
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
                              child: Text(StringConstant.job,
                                  style: TextStyle(fontSize: 10.sp)),
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
                              child: Text(StringConstant.buissness,
                                  style: TextStyle(fontSize: 10.sp)),
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
                    fieldValue: controller.workController,
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
                        controller.bloodController.text = newvalue;
                        controller.update();
                      },
                      value: bloodgroup,
                      items:
                          controller.accountBloodListData.map((String items) {
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
                        controller.statusController.text = newvalue;
                        controller.update();
                      },
                      value: status,
                      items:
                          controller.accountStatusListData.map((String items) {
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
                      if (_networkController.connectionStatus.value == 1 ||
                          _networkController.connectionStatus.value == 2) {
                        if (controller.formKey.value.currentState!.validate()) {
                          if (controller.workController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: StringConstant.work_details);
                          } else if (controller.bloodController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: StringConstant.blood_chooes);
                          } else if (controller.statusController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: StringConstant.merrige_status);
                          } else if (controller.selectedgender.value.isEmpty) {
                            Fluttertoast.showToast(msg: "તમારી જાતિ પસંદ કરો");
                          } else if (controller.selectedsurname.value.isEmpty) {
                            Fluttertoast.showToast(msg: "તમારી અટક  પસંદ કરો");
                          } else if (controller.selectedwork.value.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "તમારી વ્યવસાય વિગત પસંદ કરો");
                          } else {
                            context.loaderOverlay.show();
                            controller.isLoading.value =
                                await controller.addMember(
                              controller.nameController.text,
                              controller.fatherController.text,
                              controller.selectedsurname.value,
                              controller.selectedgender.value,
                              controller.birthController.text,
                              controller.industryController.text,
                              controller.selectedwork.value,
                              controller.workController.text,
                              controller.educationController.text,
                              controller.bloodController.text,
                              controller.statusController.text,
                            );
                            if (controller.isLoading.value) {
                              Get.back();
                              context.loaderOverlay.hide();
                            }
                          }
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
}
