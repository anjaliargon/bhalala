import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../FamilymemberDetails/Model/FamilyMemberModel.dart';




class FamilyMemberProfileController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  FamilyMemberData? FamilyuserData;

  @override
  void onInit() {
    if(Get.arguments != null) {
      FamilyuserData = Get.arguments[ArgumentConstant.familyprofiledata];
      print(FamilyuserData?.rId);
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
