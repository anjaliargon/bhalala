import 'package:bhalala/app/data/Model/basicModel.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/MemberCount.dart';
import '../model/noticeModel.dart';

class NoticeBoardController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;

  final noticedata = Notice().obs;
  RxList<String> accountVillageListData = <String>[].obs;

  @override
  void onInit() {
    getNoticeBord();
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

  Future<void> getNoticeBord() async {
    isLoading(true);
    errorOccurred(false);
    try {
      noticedata.value = await ApiProvider().notice();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
