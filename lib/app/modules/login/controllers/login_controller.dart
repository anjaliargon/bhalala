import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
      print(result);
      Get.toNamed(Routes.HOME);
      loginData.value = result;
      isLoading(true);
    } else {
      Fluttertoast.showToast(
          msg: "Wrong credential",
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
}
