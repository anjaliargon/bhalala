import 'package:get/get.dart';

import '../controllers/family_add_controller.dart';

class FamilyAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyAddController>(
      () => FamilyAddController(),
    );
  }
}
