import 'package:bhalala/app/modules/photoGallary/model/Gallaryalbum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement HomeController

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  TextEditingController yearController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  RxList<String> yearListData = <String>[].obs;
  RxList<String> functionListData = <String>[].obs;
  final yearData = Gallaryalbum().obs;
  // final gallaryphotos = Gallaryalbum().obs;

  @override
  void onInit() {
    getYearData();
    getFunctionData();
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
  // getSamitiData() async {
  //   isLoading.value = false;
  //   var result = await ApiProvider().getAlbumData_year();
  //   if (result.status == 1) {
  //     yearData.value = result;
  //     print(samitiData.value.data?.length);
  //     isLoading(true);
  //     return true;
  //   } else {
  //     isLoading(false);
  //     return true;
  //   }
  // }
  Future<void> getYearData() async {
    yearListData.clear();
    var result = await ApiProvider().getAlbumData_year();
    if (result.status == 1) {
      for (var element in result.data!) {
        yearListData.add(element.albumYear.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  Future<void> getFunctionData() async {
    functionListData.clear();
    var result = await ApiProvider().getAlbumData_year();
    if (result.status == 1) {
      for (var element in result.data!) {
        functionListData.add(element.albumName.toString());
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }
}
