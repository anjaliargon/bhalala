import 'package:bhalala/app/constant/Color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';

import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
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
            StringConstant.bhalalaparivar,
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
                  padding: const EdgeInsets.all(3.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: colors.green,
                          icon: Icons.edit,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            UrlLauncher.launch('tel:+${controller.getmemberDetailsData.value.data?[index].mobileNo}');
                          },
                          backgroundColor: colors.white,
                          icon: Icons.call,
                          foregroundColor: colors.darkbrown,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Color(0xFFFE4A49),
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 110.sp,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.getmemberDetailsData.value.data?[index].name} "
                                      "${controller.getmemberDetailsData.value.data?[index].middleName} "
                                      "${controller.getmemberDetailsData.value.data?[index].lastName}",
                                      style: TextStyle(
                                          color: colors.darkbrown,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:1.h,
                                    ),
                                    Text(
                                      "${StringConstant.mobile} : ${controller.getmemberDetailsData.value.data?[index].mobileNo}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "${StringConstant.address} : ${controller.getmemberDetailsData.value.data?[index].address}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "${StringConstant.workdetails} : ${controller.getmemberDetailsData.value.data?[index].business}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
