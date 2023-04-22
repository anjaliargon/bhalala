import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../model/sahyogmodel.dart';

class ParivarSahyogController extends GetxController {
  //TODO: Implement ParivarSahyogController

  RxBool isLoading = false.obs;
  var errorOccurred = false.obs;
  final SahyogData = Parivarsahyog().obs;
  final count = 0.obs;
  @override
  void onInit() {
    sahyogdata();
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
  Future<Parivarsahyog> sahyogdata() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading(true);
    try {
      var result = await ApiProvider().familyShyog();
      if (result.status == 1) {
        SahyogData.value = result;
        print(SahyogData.value.data?.length);
        isLoading(true);
      } else {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
    return SahyogData.value;
  }
  void increment() => count.value++;
}
