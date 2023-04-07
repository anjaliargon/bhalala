import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../routes/app_pages.dart';
import '../model/photoGallary_model.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement HomeController

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  TextEditingController yearController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  RxList<String> yearListData = <String>[].obs;

  @override
  void onInit() {
    getYearData();
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

  Future<void> getYearData() async {
    yearListData.clear();
    yearListData.add(StringConstant.workdetails);
    var result = await ApiProvider().getAlbumData();
    if (result.status == 1) {
      for (var element in result.data!) {
        yearListData.add(element.albumName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

}
