import 'package:get/get.dart';

import '../controllers/family_samiti_controller.dart';

class FamilySamitiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilySamitiController>(
      () => FamilySamitiController(),
    );
  }
}
