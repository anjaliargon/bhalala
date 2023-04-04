import 'package:get/get.dart';

import '../controllers/FamilyMemberprofile_controller.dart';

class FamilyMemberProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyMemberProfileController>(
      () => FamilyMemberProfileController(),
    );
  }
}
