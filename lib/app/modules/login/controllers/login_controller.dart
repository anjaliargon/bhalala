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
    check_permission();
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
      checkPermissions();
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

  Future<void> check_permission() async {
    MyColor colors = MyColor();
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.phone,
    ].request();

    if (statuses[Permission.camera] != PermissionStatus.granted ||
        statuses[Permission.storage] != PermissionStatus.granted ||
        statuses[Permission.phone] != PermissionStatus.granted) {
      Get.dialog(Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "Storage, CAMERA, PHONE,  Permission required for this app",
                  style: TextStyle(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      Map<Permission, PermissionStatus> statuses = await [
                        Permission.camera,
                        Permission.storage,
                        Permission.phone,
                      ].request();
                      Get.back();
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
                                padding: EdgeInsets.only(left: 10, right: 10),
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
                                        openAppSettings();
                                        Get.back();
                                      },
                                      child: Text(
                                        "CANCEL",
                                        style:
                                            TextStyle(color: colors.darkbrown),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    child: TextButton(
                                        onPressed: () {
                                          openAppSettings();
                                          // Get.back();
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
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "ALLOW",
                        style: TextStyle(color: colors.darkbrown),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: colors.darkbrown),
                      ),
                    ))
              ],
            )
          ],
        ),
      ));
    }
  }

  Future<bool> checkPermissions() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    PermissionStatus storageStatus = await Permission.storage.status;

    if (cameraStatus != PermissionStatus.granted ||
        microphoneStatus != PermissionStatus.granted ||
        storageStatus != PermissionStatus.granted) {
      return false;
    }

    return true;
  }
}
