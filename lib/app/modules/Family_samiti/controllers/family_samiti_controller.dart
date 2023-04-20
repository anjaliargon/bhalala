import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../samitiModel.dart';

class FamilySamitiController extends GetxController {
  //TODO: Implement FamilySamitiController

  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  final samitiData = Parivarsamiti().obs;
  final count = 0.obs;

  @override
  void onInit() {
    getSamitiData();
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

  getSamitiData() async {
    isLoading.value = false;
    var result = await ApiProvider().familySamiti();
    if (result.status == 1) {
      samitiData.value = result;
      isLoading(true);
      return true;
    } else {
      isLoading(false);
      return true;
    }
  }
}
