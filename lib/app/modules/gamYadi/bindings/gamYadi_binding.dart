import 'package:get/get.dart';

import '../controllers/gamYadi_controller.dart';

class GamYadiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamYadiController>(
      () => GamYadiController(),
    );
  }
}
