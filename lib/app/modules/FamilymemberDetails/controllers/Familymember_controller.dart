import 'package:bhalala/app/constant/String_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';
import '../../../constant/Color.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../routes/app_pages.dart';

import '../../memberDetails/controllers/delete_controller.dart';
import '../Model/FamilyMemberModel.dart';

class FamilyMemberController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  // var memeberId = Get.arguments;
  RxString memeberId = "".obs;
  final familyMemberData = FamilyMember().obs;
  final deletcontroller = Get.put(DeleteController());

  @override
  void onInit() {

    if(Get.arguments != null){
      memeberId.value = Get.arguments[ArgumentConstant.memberId];
      getFamilymemberCount();
    }

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

  void makeUrlRequest() {}

  Future<FamilyMember> getFamilymemberCount() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading(true);
    errorOccurred(false);
    try {
      var result = await ApiProvider().FamilymemberDetails(memeberId.value);
      if (!result.data.isNull) {
        // Get.toNamed(Routes.FAMILYMEMBER);
        familyMemberData.value = result;
        print(familyMemberData.value.data!.last.lastName);
        isLoading(true);
      } else {
        Get.back();
        Fluttertoast.showToast(
            msg: "કોઈ સભ્ય મળ્યું નથી",
            backgroundColor: Colors.white,
            textColor: Colors.black);
        isLoading(false);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return familyMemberData.value;
  }

  openDilogueNotEdit({required BuildContext context}) {
    MyColor colors = MyColor();
    return Get.dialog(Dialog(
      child: Container(
        color: colors.lightgrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 7.h,
              color: colors.darkbrown,
              child: Center(
                  child: Text(
                "નોંધ",
                style: TextStyle(color: colors.white, fontSize: 14.sp),
              )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " તમે અન્ય પારિવારિક સભ્ય ની વિગતો ને\nબદલી શકતા નથી.",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 6.h,
              width: 50.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colors.darkbrown),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "ઠીક છે ",
                    style: TextStyle(fontSize: 12.sp),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ));
  }

  openDilogueNotDelete({required BuildContext context}) {
    MyColor colors = MyColor();
    return Get.dialog(Dialog(
      child: Container(
        color: colors.lightgrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 7.h,
              color: colors.darkbrown,
              child: Center(
                  child: Text(
                "નોંધ",
                style: TextStyle(color: colors.white, fontSize: 14.sp),
              )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "તમે અન્ય કૌટુંબિક સભ્ય વિગતોને કાઢી શકતા નથી.",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 6.h,
              width: 50.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colors.darkbrown),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "ઠીક છે ",
                    style: TextStyle(fontSize: 12.sp),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ));
  }

  openDilogueDelete({required BuildContext context, required int index}) {
    MyColor colors = MyColor();
    var ids = familyMemberData.value.data?[index].fId;
    var mainids = familyMemberData.value.data?[index].rId;
    return Get.dialog(Dialog(
      child: Container(
        color: colors.lightgrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 7.h,
              color: colors.darkbrown,
              child: Center(
                  child: Text(
                "નોંધ",
                style: TextStyle(color: colors.white, fontSize: 14.sp),
              )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "શું તમે ખરેખર તમારા કુટુંબના સભ્યને તમારા\nકુટુંબની સૂચિમાંથી કાઢી નાખવા માંગો છો ? ",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 8.h,
                  width: 30.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(colors.darkbrown),
                      ),
                      onPressed: () {
                        deletcontroller.DeletefamilyDataList(ids!, index,mainids!);

                        Get.back();
                      },
                      child: Text(
                        "હા",
                        style: TextStyle(fontSize: 14.sp),
                      )),
                ),
                SizedBox(
                  height: 8.h,
                  width: 30.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(colors.darkbrown),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "ના",
                        style: TextStyle(fontSize: 14.sp),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ));
  }
}
