import 'package:bhalala/app/modules/login/model/login_model.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userLastName = ''.obs;
  RxString usermiddle = ''.obs;
  UserLogin profileData = UserLogin();
  Map<String,dynamic> data = RxMap();

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

  getUserData() async {
    userName.value = (await box.read("UserFirstname"));
    usermiddle.value = (await box.read("Usermiddlename"));
    userLastName.value = (await box.read("Userlastname"));
    userEmail.value = (await box.read("emailid"));

  }
}
