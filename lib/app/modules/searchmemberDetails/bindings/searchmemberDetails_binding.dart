import 'package:get/get.dart';

import '../controllers/searchmemberDetails_controller.dart';

class SearchMemberDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchMemberDetailsController>(
      () => SearchMemberDetailsController(),
    );
  }
}
