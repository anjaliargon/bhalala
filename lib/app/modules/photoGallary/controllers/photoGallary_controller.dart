import 'package:bhalala/app/modules/photoGallary/model/Gallaryalbum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Api/ApiProvider.dart';
import '../model/photoGallary_model.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement HomeController

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  TextEditingController yearController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  RxList<String> yearListData = <String>[].obs;
  RxList<String> functionListData = <String>[].obs;
  RxList<GallaryData> imageList = <GallaryData>[].obs;
  final imageData = Gallaryalbum().obs;
  // final yearData = Gallary_year().obs;

  @override
  void onInit() {
    getYearData();
    // getFunctionData();
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

  Future<void> getFunctionData({required String date}) async {
    functionListData.clear();
    var result = await ApiProvider().getAlbumData_year();
    if (result.status == 1) {
      for (var element in result.data!) {
        if(element.albumName!.toLowerCase().contains(date)){
        functionListData.add(element.albumName.toString());
        }
        isLoading(true);
      }
    } else {
      isLoading(false);
    }
  }

  Future<void> getImageData({required String date}) async {
    imageList.clear();
    var result = await ApiProvider().getAlbumData_year();
    if (result.status == 1) {
      for (var element in result.data!) {
        if(element.albumName! == date){
          print(element.imageUrl);
          imageList.add(element);
        }
        isLoading(true);
      }
      print(imageList.length);
    } else {
      isLoading(false);
    }
  }
}
