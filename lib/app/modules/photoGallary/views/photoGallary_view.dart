import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:email_validator/email_validator.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../constant/screens/loading_and_error_screen.dart';
import '../controllers/photoGallary_controller.dart';

class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? year;
    final loginController = Get.put(PhotoGallaryController());
    MyColor colors = MyColor();
    return GetBuilder<PhotoGallaryController>(
      init: loginController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: colors.darkbrown,
          elevation: 0,
          centerTitle: true,
          title: Text(
            StringConstant.bhalalaparivar,
            style: TextStyle(color: colors.white, fontSize: 20.sp),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  customeDropDown(
                      dropdown: DropdownButton(
                    hint: Text(StringConstant.workdetails),
                    isExpanded: true,
                    underline: Container(
                      color: colors.white,
                    ),
                    onChanged: (String? newvalue) {
                      year = newvalue!;
                      controller.yearController.text = newvalue;
                      controller.update();
                    },
                    value: year,
                    items: controller.yearListData.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  )),
                  customeDropDown(
                      dropdown: DropdownButton(
                        hint: Text(StringConstant.workdetails),
                        isExpanded: true,
                        underline: Container(
                          color: colors.white,
                        ),
                        onChanged: (String? newvalue) {
                          year = newvalue!;
                          controller.yearController.text = newvalue;
                          controller.update();
                        },
                        value: year,
                        items: controller.yearListData.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
