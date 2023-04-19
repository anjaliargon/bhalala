import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../model/samitiModel.dart';

class FamilySamitiController extends GetxController {
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

  Future<void> getSamitiData() async {
    isLoading(false);
    errorOccurred(false);
    try {
      var result = await ApiProvider().familySamiti();
      if (result.status == 1) {
        samitiData.value = result;
        isLoading(true);
      }else{}
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
