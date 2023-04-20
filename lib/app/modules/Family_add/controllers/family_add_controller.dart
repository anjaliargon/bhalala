import 'package:get/get.dart';

class FamilyAddController extends GetxController {
  //TODO: Implement FamilyAddController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
