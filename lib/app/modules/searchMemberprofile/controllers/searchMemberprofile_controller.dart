import 'package:get/get.dart';

import '../../../constant/String_constant.dart';
import '../../searchMember/model/search_model.dart';



class SearchProfileController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  searchData? searchuserData;

  @override
  void onInit() {
    if(Get.arguments != null) {
      searchuserData = Get.arguments[ArgumentConstant.searchuserData];
      print(searchuserData?.rId);
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
