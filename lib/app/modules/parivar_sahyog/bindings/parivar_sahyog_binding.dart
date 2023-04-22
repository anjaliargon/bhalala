import 'package:get/get.dart';

import '../controllers/parivar_sahyog_controller.dart';

class ParivarSahyogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParivarSahyogController>(
      () => ParivarSahyogController(),
    );
  }
}
