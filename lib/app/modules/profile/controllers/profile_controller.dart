import 'package:bhalala/app/modules/login/model/login_model.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userMobile = ''.obs;
  RxString userAddress = ''.obs;
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

    userEmail.value = profileData.loginData?.emailed ?? '';
    userName.value = profileData.loginData?.name ?? '';
    userMobile.value = profileData.loginData?.mobileNo ?? '';
    userAddress.value = profileData.loginData?.address ?? '';
  }
}
