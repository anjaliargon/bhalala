
import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:email_validator/email_validator.dart';

import '../../../../main.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../network/controller/network_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return GetBuilder<LoginController>(
      init: loginController,
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            StringConstant.bhalalaparivar,
            style: TextStyle(
                color: colors.darkbrown,
                fontWeight: FontWeight.bold,
                fontSize: 23.sp),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/applogo.png",
                        height: 120.sp),
                  ),
                  SizedBox(
                    height: 5.h,
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
                            } else if (EmailValidator.validate(value.trim()) ==
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
                          iconButton: IconButton(
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () async{
                      if (box.read("sdkVersion") >= 33){
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.camera,
                          Permission.photos,
                          Permission.phone,
                        ].request();
                        if (_networkController.connectionStatus.value == 1 ||
                            _networkController.connectionStatus.value == 2 ||
                            _networkController.connectionStatus.value == 3) {
                          if (statuses[Permission.camera] !=
                              PermissionStatus.granted ||
                              statuses[Permission.photos] !=
                                  PermissionStatus.granted ||
                              statuses[Permission.phone] !=
                                  PermissionStatus.granted) {
                            Get.dialog(Dialog(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Permission",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                        "Allow Bhalala parivar to access  storage,CAMERA and PHONE permission for use some features \nTap Settings->Permission and turn all permission on.",
                                        style: TextStyle(fontSize: 12.sp)),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "CANCEL",
                                            style: TextStyle(
                                                color: colors.darkbrown),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 5),
                                        child: TextButton(
                                            onPressed: () {
                                              openAppSettings();
                                              Get.back();
                                            },
                                            child: Text(
                                              "SETTINGS",
                                              style: TextStyle(
                                                  color: colors.darkbrown),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                          } else {
                            if (controller.formKey.value.currentState!
                                .validate()) {
                              FocusScope.of(context).unfocus();
                              context.loaderOverlay.show(
                                  widget: Container(
                                    height: 5.h,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircularProgressIndicator(
                                              color: colors.darkbrown),
                                        ),
                                        Text(
                                          "કૃપા કરી ને રાહ જોવો",
                                          style: TextStyle(color: colors.black),
                                        ),
                                      ],
                                    ),
                                  ));
                              controller.isLoading.value = await controller.login(
                                  controller.emailController.value.text,
                                  controller.passwordController.value.text);
                              if (controller.isLoading.value) {
                                context.loaderOverlay.hide();
                              }
                            } else {
                              return;
                            }
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg:
                              "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                              textColor: colors.black,
                              backgroundColor: colors.white);
                        }
                      }else{
                      Map<Permission, PermissionStatus> statuses = await
                      [
                      Permission.camera,
                      Permission.storage,
                      Permission.phone,
                      ].request();
                      if (_networkController.connectionStatus.value == 1 ||
                          _networkController.connectionStatus.value == 2 ||
                          _networkController.connectionStatus.value == 3) {
                        if (statuses[Permission.camera] !=
                            PermissionStatus.granted ||
                            statuses[Permission.storage] !=
                                PermissionStatus.granted ||
                            statuses[Permission.phone] !=
                                PermissionStatus.granted) {
                          Get.dialog(Dialog(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Permission",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                      "Allow Bhalala parivar to access  storage,CAMERA and PHONE permission for use some features \nTap Settings->Permission and turn all permission on.",
                                      style: TextStyle(fontSize: 12.sp)),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(
                                              color: colors.darkbrown),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 5),
                                      child: TextButton(
                                          onPressed: () {
                                            openAppSettings();
                                            Get.back();
                                          },
                                          child: Text(
                                            "SETTINGS",
                                            style: TextStyle(
                                                color: colors.darkbrown),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ));
                        } else {
                          if (controller.formKey.value.currentState!
                              .validate()) {
                            FocusScope.of(context).unfocus();
                            context.loaderOverlay.show(
                                widget: Container(
                                  height: 5.h,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0),
                                        //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                            color: colors.darkbrown),
                                      ),
                                      Text(
                                        "કૃપા કરી ને રાહ જોવો",
                                        style: TextStyle(color: colors.black),
                                      ),
                                    ],
                                  ),
                                ));
                            controller.isLoading.value = await controller.login(
                                controller.emailController.value.text,
                                controller.passwordController.value.text);
                            if (controller.isLoading.value) {
                              context.loaderOverlay.hide();
                            }
                          } else {
                            return;
                          }
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg:
                            "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                            textColor: colors.black,
                            backgroundColor: colors.white);
                      }
                      }

                   } ,
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
                            fontSize: 14.sp),
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
                            fontSize: 14.sp),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HELPLINE);
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
                            fontSize: 14.sp),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
