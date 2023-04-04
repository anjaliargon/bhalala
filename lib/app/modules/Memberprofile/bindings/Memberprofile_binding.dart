import 'package:get/get.dart';

import '../controllers/Memberprofile_controller.dart';

class MemberProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberProfileController>(
      () => MemberProfileController(),
    );
  }
}
