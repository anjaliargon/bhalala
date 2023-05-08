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
  RxList<smitiData> samiti4 = RxList<smitiData>([]);
  RxList<smitiData> samiti5 = RxList<smitiData>([]);
  RxList<smitiData> samiti6 = RxList<smitiData>([]);
  RxList<smitiData> samiti7 = RxList<smitiData>([]);
  RxList<smitiData> samiti8 = RxList<smitiData>([]);
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
        karobariList.value = dataList.where((p0) => p0.samityType == "3").toList();
        sthapakList.value = dataList.where((p0) => p0.samityType == "2").toList();
        samiti4.value = dataList.where((p0) => p0.samityType == "4").toList();
        samiti5.value = dataList.where((p0) => p0.samityType == "5").toList();
        samiti6.value = dataList.where((p0) => p0.samityType == "6").toList();
        samiti7.value = dataList.where((p0) => p0.samityType == "7").toList();
        samiti8.value = dataList.where((p0) => p0.samityType == "8").toList();
      } else {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
    return samitiData.value;
  }
}
