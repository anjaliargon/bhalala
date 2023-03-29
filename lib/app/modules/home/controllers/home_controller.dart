import 'package:get/get.dart';

import '../../../constant/shreprefrence.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final userName = ''.obs;
  final userEmail = ''.obs;
  final userLastName = ''.obs;
  final count = 0.obs;

  @override
  void onInit() {
    getUserData();
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
  getUserData() async {
    userName.value = (await MySharedPreferences().getUserName()) ?? '';
    userLastName.value = (await MySharedPreferences().getUserLastname()) ?? '';
    userEmail.value = (await MySharedPreferences().getUserEmail()) ?? '';
  }
}
