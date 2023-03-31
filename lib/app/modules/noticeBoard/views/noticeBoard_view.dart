import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';

import '../controllers/noticeBoard_controller.dart';

class NoticeBoardView extends GetView<NoticeBoardController> {
  const NoticeBoardView({Key? key}) : super(key: key);

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
      body: Obx(
        () => LoadingAndErrorScreen(
          isLoading: controller.isLoading.value,
          errorOccurred: controller.errorOccurred.value,
          errorResolvingFunction: controller.getNoticeBord,
          child: ListView.builder(
            itemCount: controller.noticedata.value.newsEvents?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.lightgrey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 4),
                        child: Text(
                          controller.noticedata.value.newsEvents?[index].title ??'',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,left: 8,bottom: 4),
                        child: Text(controller
                            .noticedata.value.newsEvents?[index].description ??'',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp),),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
