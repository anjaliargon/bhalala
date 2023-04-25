import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../samitiModel.dart';

class FamilySamitiController extends GetxController {
  //TODO: Implement FamilySamitiController

  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  Rx<Parivarsamiti> samitiData = Parivarsamiti().obs;
  RxList<smitiData> dataList = RxList<smitiData>([]);
  RxList<smitiData> sthapakList = RxList<smitiData>([]);
  RxList<smitiData> karobariList = RxList<smitiData>([]);
  final count = 0.obs;

  @override
  Future<void> onInit() async {
    await getSamitiData();

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

  Future<Parivarsamiti> getSamitiData() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading(true);

    try {
      var result = await ApiProvider().familySamiti();
      if (result.status == 1) {
        samitiData.value = result;
        dataList.clear();
        karobariList.clear();
        sthapakList.clear();
        samitiData.value.data!.forEach((element) {
          dataList.add(element);
        });
        karobariList.value =
            dataList.where((p0) => p0.samityType == "3").toList();
        sthapakList.value =
            dataList.where((p0) => p0.samityType == "2").toList();
      } else {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
    return samitiData.value;
  }
}
