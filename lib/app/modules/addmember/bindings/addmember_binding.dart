import 'package:get/get.dart';

import '../controllers/addmember_controller.dart';

class AddmemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddmemberController>(
      () => AddmemberController(),
    );
  }
}
