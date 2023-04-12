import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../constant/screens/loading_and_error_screen.dart';
import '../controllers/addmember_controller.dart';

class AddmemberView extends GetView<AddmemberController> {
  const AddmemberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? industry;
    String? education;
    String? bloodgroup;
    String? status;
    String? village;
    String? currentcity;
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
        body: LoadingAndErrorScreen(
          isLoading: controller.isLoading.value,
          errorOccurred: controller.errorOccurred.value,
          errorResolvingFunction: controller.isLoading,
          child: SingleChildScrollView(
            child: Obx(
              () => Form(
                key: controller.formKey.value,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    // CustomeTextFields(
                    //   iconfat: FontAwesomeIcons.solidCircleUser,
                    //   keyboard: 0,
                    //   hint: StringConstant.name,
                    //   validation: true,
                    //   fieldValue: controller.nameController,
                    // ),
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
                                    value: "Bhalala",
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
                                    value: "Women77",
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
                    customTextField(
                        hintText: StringConstant.work_details,
                        iconfat: FontAwesomeIcons.shop,
                        controller: controller.workController),
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
                        items: controller.accountStatusListData
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
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () async {
                        if (controller.formKey.value.currentState!.validate()) {
                          // var isCreateTask =
                          // await controller
                          //     .userProfilePatchList(
                          //   controller.nameController.text,
                          //   controller.fatherController.text,
                          //   controller.selectedsurname.value,
                          //   controller.birthController.text,
                          //   controller.selectedgender.value,
                          //   controller.addressController.text,
                          //   controller.emailController.text,
                          //   controller.mobileController.text,
                          //   controller.industryController.text,
                          //   controller.selectedwork.value,
                          //   controller.workController.text,
                          //   controller.educationController.text,
                          //   controller.bloodController.text,
                          //   controller.villageController.text,
                          //   controller.currentCityController.text,
                          //   controller.statusController.text,
                          // );
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
        ),
      );
    });
  }
}
