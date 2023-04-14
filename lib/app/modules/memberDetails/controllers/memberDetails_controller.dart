import 'package:bhalala/app/data/Model/basicModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';
import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../data/Api/ApiProvider.dart';
import '../../../data/Model/MemberCount.dart';
import '../../../routes/app_pages.dart';
import '../Model/MemberDetailsModel.dart';
import 'delete_controller.dart';

class MemberDetailsController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var villageId = Get.arguments;
  final getmemberDetailsData = MemberDetails().obs;
  final deletcontroller = Get.put(DeleteController());

  @override
  void onInit() {
    getAccountmemberCount();
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

  Future<void> getAccountmemberCount() async {
    isLoading(true);
    errorOccurred(false);
    try {
      var result = await ApiProvider().memberDetailsCount(villageId);
      if (!result.data.isNull) {
        Get.toNamed(Routes.MEMBER);
        getmemberDetailsData.value = result;
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "તમે અન્ય  કૌટુંબિક સભ્ય વિગતોને કાઢી શકતા નથી.",
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

  openDilogueDelete({required BuildContext context,required int index}) {
    MyColor colors = MyColor();
    var ids =  box.read('userId');
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
                      deletcontroller.DeleteDataList(ids,index);
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
