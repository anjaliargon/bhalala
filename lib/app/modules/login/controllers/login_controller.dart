import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../network/controller/network_controller.dart';
import '../../../routes/app_pages.dart';
import '../model/ForgotModel.dart';
import '../model/login_model.dart';
import 'forgot_controller_controller.dart';

class LoginController extends GetxController {
  //TODO: Implement HomeController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<GlobalKey<FormState>> forgotformKey = GlobalKey<FormState>().obs;
  final ForgotControllerController forgotController =
      Get.put(ForgotControllerController());
  final NetworkController _networkController = Get.put(NetworkController());
  final loginData = UserLogin().obs;
  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> forgotemailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  var ispasswordvisible = true.obs;
  RxString emailValid = ''.obs;
  RxString passwordValid = ''.obs;
  final errorText = RxString('');
  final count = 0.obs;

  @override
  void onInit() {
    check_permission();
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
    isLoading.value = false;
    var result = await ApiProvider().login(email, password);
    if (!result.loginData.isNull) {
      Get.toNamed(Routes.HOME);
      loginData.value = result;
      isLoading(true);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Enter correct UserName And Password",
          backgroundColor: Colors.white,
          textColor: Colors.black);
      isLoading(false);
      return true;
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
              child: Form(
                key: forgotformKey.value,
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Edit"),
                  controller: forgotemailController.value,
                ),
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
                      onPressed: () async {
                        if (_networkController.connectionStatus.value == 1 ||
                            _networkController.connectionStatus.value == 2) {
                          if (forgotformKey.value.currentState!.validate()) {
                            if (forgotemailController.value.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "ઈમેલ આઈડી જરૂરી છે ");
                            } else {
                              context.loaderOverlay.show();
                              isLoading.value =
                                  await forgotController.forgotpassword(
                                      forgotemailController.value.text);
                              if (isLoading.value) {
                                context.loaderOverlay.hide();
                              } else {
                                return;
                              }
                              Get.back();
                              forgotemailController.value.clear();
                            }
                          }
                        }
                      },
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
    if (Platform.isAndroid) {
      var androidVersion = Platform.operatingSystemVersion;
      if (androidVersion.startsWith('12.')) {
        print("12");
      } else if (androidVersion.startsWith('13.')) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.camera,
          Permission.storage,
          Permission.phone,
        ].request();

        print('Android 12 or 13 OS');
      }
      else{
        print("nothing");
      }
    }
  }

  Future<bool> checkPermissions() async {
    MyColor colors = MyColor();
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus phoneStatus = await Permission.phone.status;
    PermissionStatus storageStatus = await Permission.storage.status;

    if (cameraStatus != PermissionStatus.granted ||
        phoneStatus != PermissionStatus.granted ||
        storageStatus != PermissionStatus.granted) {
      return false;
    }

    return true;
  }
}
