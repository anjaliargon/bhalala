import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';

import '../../../routes/app_pages.dart';
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
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.NOTICEBOARD,arguments: {
                     ArgumentConstant.newsEvent:controller.noticedata.value.newsEvents?[index]
                    });
                    print(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("..અગત્યની સુચના...",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),),
                        SizedBox(height: 2.h,),
                        Text("આદરણીય પરિવારજનો ",style: TextStyle(fontSize: 12.sp),),
                        SizedBox(height: 2.h,),
                        Text(
                          controller.noticedata.value.newsEvents?[index].title ??'',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp),
                        ),
                        Divider(height: 1.h,thickness: 1,color: colors.darkbrown,)
                      ],
                    ),
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
