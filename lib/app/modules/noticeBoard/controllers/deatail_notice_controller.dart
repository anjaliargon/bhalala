import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../model/noticeModel.dart';

class DeatailNoticeController extends GetxController {
  //TODO: Implement DeatailNoticeController
  NewsEvents? userData;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    if(Get.arguments != null) {
      userData = Get.arguments[ArgumentConstant.newsEvent];
      print(userData?.id);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
