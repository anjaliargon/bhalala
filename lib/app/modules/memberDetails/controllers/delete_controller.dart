import 'package:bhalala/app/modules/memberDetails/Model/Deletemodel.dart';
import 'package:get/get.dart';
import 'package:bhalala/app/constant/toast.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../FamilymemberDetails/controllers/Familymember_controller.dart';

class DeleteController extends GetxController {
  //TODO: Implement DeleteController

  final count = 0.obs;
  Rx<deleteRecords> DeleteData = deleteRecords().obs;

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
  var isLoading = false.obs;

  DeleteDataList(String ids, var index) async {
    print(ids);
    try {
      var result = await ApiProvider().deleteData(ids);
      if (result.status == 1) {
        showBottomLongToast(result.message.toString());
        Get.back();
      } else if (result.status == 2) {
        isLoading(false);
        showBottomLongToast(result.message.toString());
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  DeletefamilyDataList(String ids, var index, String mainids) async {
    print(ids);
    print(mainids);
    try {
      var result = await ApiProvider().deleteFamilyData(ids, mainids);
      if (result.status == 1) {
        showBottomLongToast(result.message.toString());
        Get.back();
      } else if (result.status == 2) {
        isLoading(false);
        showBottomLongToast(result.message.toString());
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
