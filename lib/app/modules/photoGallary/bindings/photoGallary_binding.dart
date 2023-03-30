import 'package:get/get.dart';

import '../controllers/photoGallary_controller.dart';

class PhotoGallaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoGallaryController>(
      () => PhotoGallaryController(),
    );
  }
}
