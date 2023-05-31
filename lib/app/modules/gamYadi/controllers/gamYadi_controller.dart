import 'package:bhalala/app/data/Model/basicModel.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/MemberCount.dart';

class GamYadiController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;

  final getvillageData = BasicModel().obs;
  final getmemberData = MemberCount().obs;

  @override
  void onInit() {
    getAccountmemberCount();
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

  Future<void> getAccountmemberCount() async {
    isLoading(true);
    errorOccurred(false);
    try {
      getmemberData.value = await ApiProvider().memberCount();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
