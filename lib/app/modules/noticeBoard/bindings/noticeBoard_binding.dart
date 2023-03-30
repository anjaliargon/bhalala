import 'package:get/get.dart';

import '../controllers/noticeBoard_controller.dart';

class NoticeBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeBoardController>(
      () => NoticeBoardController(),
    );
  }
}
