import 'package:get/get.dart';

import '../controllers/Familymember_controller.dart';

class FamilyMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyMemberController>(
      () => FamilyMemberController(),
    );
  }
}
