import 'package:get/get.dart';

import '../controllers/verify_user_profile_controller.dart';

class VerifyUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyUserProfileController>(
      () => VerifyUserProfileController(),
    );
  }
}
