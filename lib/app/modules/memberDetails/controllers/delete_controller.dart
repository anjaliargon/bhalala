import 'package:bhalala/app/modules/memberDetails/Model/Deletemodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';

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
      var result =
      await ApiProvider().deleteData(ids);
      if (result.status == 1) {
       Fluttertoast.showToast(msg: result.message.toString());
      } else if (result.status == 2) {
        isLoading(false);
        Fluttertoast.showToast(msg:  result.message.toString());
      }
    } catch (e) {
      print(e);
    } finally {

    }
  }
}
