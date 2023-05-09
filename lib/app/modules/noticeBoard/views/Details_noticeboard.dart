import 'package:bhalala/app/constant/String_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../controllers/deatail_notice_controller.dart';

class NoticeBoardDetailsView extends GetView<DeatailNoticeController> {
   NoticeBoardDetailsView({Key? key}) : super(key: key);
  final details = Get.put(DeatailNoticeController());
  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringConstant.suchna_number,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: colors.darkbrown,
          elevation: 0),
      body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: colors.lightgrey,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 8, left: 8, bottom: 4),
                  child: Text(
                    details.userData?.title??'',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15.sp),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(right: 8, left: 8, bottom: 4),
                  child: Text(
                    details.userData?.description??'',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
