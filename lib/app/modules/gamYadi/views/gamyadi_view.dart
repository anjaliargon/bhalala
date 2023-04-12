import 'package:bhalala/app/constant/Color.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';

import '../../../network/controller/network_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/gamYadi_controller.dart';

class GamYadiView extends GetView<GamYadiController> {
  GamYadiView({Key? key}) : super(key: key);
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: colors.darkbrown,
          title: Text(
            StringConstant.gamniyadi,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0),
      body: Obx(
        () => LoadingAndErrorScreen(
            isLoading: controller.isLoading.value,
            errorOccurred: controller.errorOccurred.value,
            errorResolvingFunction: controller.getmemberData,
            child: (_networkController.connectionStatus.value == 1 ||
                    _networkController.connectionStatus.value == 2)
                ? GridView.builder(
                    itemCount: controller.getmemberData.value.data?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.MEMBER,
                                arguments: controller.getmemberData.value
                                    .data?[index].village?.vId);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.lightgrey,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.getmemberData.value.data?[index]
                                          .village?.vName ??
                                      '',
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "કુટુંબ ની સંખ્યા  - ${controller.getmemberData.value.data?[index].count}",
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "જન  સંખ્યા  - ${controller.getmemberData.value.data?[index].allMemeber}",
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                      "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                      style: TextStyle(color: colors.darkbrown, fontSize: 14.sp),
                  ),
                    ))),
      ),
    );
  }
}
