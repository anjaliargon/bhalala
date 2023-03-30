import 'package:get/get.dart';

import '../../../../main.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final userName = ''.obs;
  final usermiddle = ''.obs;
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
    userName.value = (await box.read("UserFirstname"));
    usermiddle.value = (await box.read("Usermiddlename"));
    userLastName.value = (await box.read("Userlastname"));
    userEmail.value = (await box.read("emailid"));

  }
}
