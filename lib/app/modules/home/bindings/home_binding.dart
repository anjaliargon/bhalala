import 'package:get/get.dart';

import 'package:bhalala/app/modules/login/controllers/forgot_controller_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotControllerController>(
      () => ForgotControllerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
