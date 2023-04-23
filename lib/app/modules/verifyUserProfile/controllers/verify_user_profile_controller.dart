import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../Family_add/model/familyAddmodel.dart';

class VerifyUserProfileController extends GetxController {
  //TODO: Implement VerifyUserProfileController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final count = 0.obs;
  StatusData?statusData;
  @override
  void onInit() {
    if(Get.arguments != null) {
      statusData = Get.arguments[ArgumentConstant.familyadd];
      print(statusData?.rId);
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
