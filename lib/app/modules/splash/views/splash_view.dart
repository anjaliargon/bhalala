import 'dart:async';
import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/String_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';
import '../../../constant/sizeConstant.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isStared = false;

  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() async {
    await Future.delayed(const Duration(milliseconds: 15));
    isStared = true;
    Timer(const Duration(seconds: 4), () {
      if (!isNullEmptyOrFalse(box.read("userId"))) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/applogo.png",
              height: 22.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              StringConstant.bhalalaparivar,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: colors.darkbrown,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
