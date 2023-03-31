import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:email_validator/email_validator.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../constant/screens/loading_and_error_screen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    MyColor colors = MyColor();
    return GetBuilder<LoginController>(
      init: loginController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            StringConstant.bhalalaparivar,
            style: TextStyle(
                color: colors.darkbrown,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
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
            () => LoadingAndErrorScreen(
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.login,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/applogo.png",
                          height: 150.sp),
                    ),
                    Form(
                      key: controller.formKey.value,
                      child: Column(
                        children: [
                          customTextField(
                            hintText: StringConstant.emailId,
                            iconfat: FontAwesomeIcons.solidCircleUser,
                            controller: controller.emailController.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Email";
                              } else if (EmailValidator.validate(
                                      value.trim()) ==
                                  false) {
                                return "Please Enter Valid Email";
                              }
                              return null;
                            },
                          ),
                          customTextField(
                            obscureText: controller.ispasswordvisible.value,
                            hintText: StringConstant.password,
                            iconfat: FontAwesomeIcons.lock,
                            controller: controller.passwordController.value,
                            suffixicon: IconButton(
                                onPressed: () {
                                  controller.ispasswordvisible.value =
                                      !controller.ispasswordvisible.value;
                                },
                                icon: (controller.ispasswordvisible.value)
                                    ? const FaIcon(FontAwesomeIcons.eye)
                                    : const FaIcon(FontAwesomeIcons.eyeSlash),
                                color: colors.darkbrown),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter password";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 5.h,
                        child: InkWell(
                          onTap: () {
                            controller.openDilogue(context: context);
                          },
                          child: Text(
                            StringConstant.forgotpassword,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.sp,
                    ),
                    InkWell(
                      onTap: () {

                        if (controller.formKey.value.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          controller.login(
                              controller.emailController.value.text,
                              controller.passwordController.value.text);
                        } else {
                          return;
                        }
                        controller.emailController.value.clear();
                        controller.passwordController.value.clear();
                      },
                      child: Container(
                        height: 6.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: colors.darkbrown,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          StringConstant.login,
                          style: TextStyle(
                              color: colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                        controller.emailController.value.clear();
                        controller.passwordController.value.clear();
                        Get.deleteAll();
                      },
                      child: Container(
                        height: 6.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: colors.darkbrown,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          StringConstant.signup,
                          style: TextStyle(
                              color: colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.APP_HELPLINE);
                      },
                      child: Container(
                        height: 6.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: colors.darkbrown,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          StringConstant.applicationhlpline,
                          style: TextStyle(
                              color: colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
