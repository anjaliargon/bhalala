import 'package:get/get.dart';

import '../controllers/memberDetails_controller.dart';

class MemberDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberDetailsController>(
      () => MemberDetailsController(),
    );
  }
}
