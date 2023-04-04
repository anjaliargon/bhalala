import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../memberDetails/Model/MemberDetailsModel.dart';



class MemberProfileController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  MemberData? userData;

  @override
  void onInit() {
    if(Get.arguments != null) {
      userData = Get.arguments[ArgumentConstant.userData];
      print(userData?.rId);
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
}
