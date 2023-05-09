import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../widget/temp2.dart';
import '../controllers/signup_add_controller.dart';

class SignUpView extends GetView<SignupAddController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    String? industry;
    String? education;
    String? bloodgroup;
    String? status;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: controller.familyformKey.value,
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
                fieldValue: controller.f_nameController,
              ),
              CustomeTextFields(
                iconfat: FontAwesomeIcons.solidCircleUser,
                keyboard: 0,
                hint: StringConstant.fathername,
                validation: true,
                fieldValue:controller.f_fatherController,
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
                              groupValue: controller.f_selectedsurname.value,
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
                              groupValue: controller.f_selectedsurname.value,
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
                              groupValue: controller.f_selectedgender.value,
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
                              groupValue: controller.f_selectedgender.value,
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
                fieldValue:controller. f_birthController,
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
                      industry = newvalue!;
                      controller.f_industryController.text = newvalue;

                    },
                    value: industry,
                    items: controller.f_accountIndustryListData.map((items) {
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
                              groupValue: controller.f_selectedwork.value,
                              activeColor: colors.darkbrown,
                              onChanged: (value) {
                                controller.onChnagedWork(value);
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
                              groupValue: controller.f_selectedwork.value,
                              activeColor: colors.darkbrown,
                              onChanged: (value) {
                                controller.onChnagedWork(value);
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
                              groupValue: controller.f_selectedwork.value,
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
                fieldValue: controller.f_workController,
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
                    controller.f_educationController.text = newvalue;
                    controller.update();
                  },
                  value: education,
                  items: controller.f_accountEducationListData.map((String items) {
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
                    controller.f_bloodController.text = newvalue;
                    controller.update();
                  },
                  value: bloodgroup,
                  items: controller.f_accountBloodListData.map((String items) {
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
                    controller.f_statusController.text = newvalue;
                    controller. update();
                  },
                  value: status,
                  items: controller.f_accountStatusListData.map((String items) {
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
                  // await  signucontroller.userRegistration(
                  //   signucontroller.nameController.text,
                  //   signucontroller.fatherController.text,
                  //   signucontroller.selectedsurname.value,
                  //   signucontroller.selectedgender.value,
                  //   signucontroller.addressController.text,
                  //   signucontroller.birthController.text,
                  //   signucontroller.emailController.text,
                  //   signucontroller.passwordController.text,
                  //   signucontroller.mobileController.text,
                  //   signucontroller.industryController.text,
                  //   signucontroller.selectedwork.value,
                  //   signucontroller.workController.text,
                  //   signucontroller.memberController.text,
                  //   signucontroller.educationController.text,
                  //   signucontroller.bloodController.text,
                  //   signucontroller.villageController.text,
                  //   signucontroller.villageController.text,
                  //   signucontroller.currentCityController.text,
                  //   signucontroller.statusController.text,
                  // );
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
    );
  }
}