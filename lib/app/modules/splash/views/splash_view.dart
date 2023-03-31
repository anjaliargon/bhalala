import 'dart:async';
import 'package:bhalala/app/modules/home/views/home_view.dart';
import 'package:bhalala/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    timer();
  }


  timer() async {

    await Future.delayed(Duration(milliseconds: 15));
    isStared = true;
    Timer(const Duration(seconds: 4), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      bool? isLogin = box.read("login") ?? false;
      setState(() {});

      if (isLogin) {
        Get.offAll(HomeView());
      } else {
     // Yodo1MAS.instance.showRewardAd();
        Get.offAll(LoginView());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("assets/images/applogo.png")
      ),
    );
  }
}
