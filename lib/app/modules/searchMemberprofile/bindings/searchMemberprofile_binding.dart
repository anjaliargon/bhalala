import 'package:get/get.dart';

import '../controllers/searchMemberprofile_controller.dart';

class SearchProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProfileController>(
      () => SearchProfileController(),
    );
  }
}
