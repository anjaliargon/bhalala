import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../routes/app_pages.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  //TODO: Implement HomeController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final loginData = UserLogin().obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  var ispasswordvisible = true.obs;
  RxString emailValid = ''.obs;
  RxString passwordValid = ''.obs;
  final count = 0.obs;

  @override
  void onInit() {
    checkPermissions();
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

  login(String email, password) async {
    var result = await ApiProvider().login(email, password);
    if (!result.loginData.isNull) {
      // checkPermissions();
      Get.toNamed(Routes.HOME);
      loginData.value = result;
      isLoading(true);
    } else {
      Fluttertoast.showToast(
          msg: "Enter correct UserName And Password",
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(false);
    }
  }

  openDilogue({required BuildContext context}) {
    MyColor colors = MyColor();
    return Get.dialog(Dialog(
      child: Container(
        width: 20.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 7.h,
              color: colors.darkbrown,
              child: Center(
                  child: Text(
                    StringConstant.forgotpassword,
                    style: TextStyle(color: colors.white, fontSize: 14.sp),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              StringConstant.dilogueemail,
              style: TextStyle(fontSize: 14.sp, color: colors.darkbrown),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 8, bottom: 15),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Edit"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 6.h,
                  width: 25.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(colors.darkbrown),
                      ),
                      onPressed: () {},
                      child: Text(
                        StringConstant.send,
                        style: TextStyle(fontSize: 12.sp),
                      )),
                ),
                SizedBox(
                  height: 6.h,
                  width: 25.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(colors.darkbrown),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        StringConstant.cancel,
                        style: TextStyle(fontSize: 12.sp),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ));
  }

  checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.phone,
    ].request();
    if (statuses == PermissionStatus.granted) {
      Fluttertoast.showToast(
          msg: "permission granted",
          backgroundColor: Colors.white,
          textColor: Colors.black);
      // _openDilogue(context: context);
    } else {
      Get.dialog(Dialog(
        child: Container(
          width: 10.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Storage,CAMERA,PHONE Permission required for this app..",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(fontSize: 12.sp),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextButton(
                        onPressed: () async {
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.camera,
                            Permission.storage,
                            Permission.phone,
                          ].request();
                          if (statuses == PermissionStatus.granted) {
                            Fluttertoast.showToast(
                                msg: "permission granted",
                                backgroundColor: Colors.white,
                                textColor: Colors.black);
                          } else {
                            Get.dialog(Dialog(
                              child: Container(
                                width: 10.w,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Permission"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Allow Bhalala parivar to access  storage,Camara and phone permission for use some features\nTap Settings->Permission and turn all permission on.",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                "CANCEL",
                                                style:
                                                TextStyle(fontSize: 12.sp),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: TextButton(
                                              onPressed: () async {
                                                openAppSettings();
                                              },
                                              child: Text(
                                                "SETTING",
                                                style:
                                                TextStyle(fontSize: 12.sp),
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          }
                        },
                        child: Text(
                          "ALLOW",
                          style: TextStyle(fontSize: 12.sp),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ));
    }
  }

  check_permission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.phone,
    ].request();
    if (statuses == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: 'Permission Granted');
    }
    if (statuses == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: 'you need to provide call permission');
    }
    if (statuses == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}