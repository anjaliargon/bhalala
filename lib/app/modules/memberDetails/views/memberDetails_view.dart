import 'package:bhalala/app/constant/Color.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';

import '../../../routes/app_pages.dart';
import '../controllers/memberDetails_controller.dart';

class MemberDetailsView extends GetView<MemberDetailsController> {
  const MemberDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringConstant.gamniyadi,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: colors.darkbrown,
          elevation: 0),
      body: Obx(
        () => LoadingAndErrorScreen(
            isLoading: controller.isLoading.value,
            errorOccurred: controller.errorOccurred.value,
            errorResolvingFunction: controller.getAccountmemberCount,
            child: ListView.builder(
              itemCount: controller.getmemberDetailsData.value.data?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.lightgrey),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/userprofile.png"),
                            radius: 35,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.getmemberDetailsData.value.data?[index].name} "
                                  "${controller.getmemberDetailsData.value.data?[index].middleName} "
                                  "${controller.getmemberDetailsData.value.data?[index].lastName}",
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  "${StringConstant.mobile} : ${controller.getmemberDetailsData.value.data?[index].mobileNo}",
                                  style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  "${StringConstant.address} : ${controller.getmemberDetailsData.value.data?[index].address}",
                                  style: TextStyle(fontSize: 12.sp, overflow: TextOverflow.ellipsis,fontWeight:FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  "${StringConstant.workdetails} : ${controller.getmemberDetailsData.value.data?[index].business}",
                                  style: TextStyle(fontSize: 12.sp, overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
