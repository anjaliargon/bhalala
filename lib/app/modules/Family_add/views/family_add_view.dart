import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/screens/loading_and_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../controllers/family_add_controller.dart';

class FamilyAddView extends GetView<FamilyAddController> {
  FamilyAddView({Key? key}) : super(key: key);

  final familyadd = Get.put(FamilyAddController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.darkbrown,
        title: const Text('Add Members'),
        centerTitle: true,
      ),
      body: Obx(
        () => LoadingAndErrorScreen(
          isLoading: controller.isLoading.value,
          errorOccurred: controller.errorOccurred.value,
          errorResolvingFunction: controller.isLoading,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          // if (controller.getmemberDetailsData.value
                          //     .data?[index].rId ==
                          //     box.read('userId')) {
                          //   Get.toNamed(Routes.EditProfile, arguments: {
                          //     ArgumentConstant.editprofiledata: controller
                          //         .getmemberDetailsData.value.data![index]
                          //   });
                          // } else {
                          //   controller.openDilogueNotEdit(context: context);
                          // }
                        },
                        backgroundColor: colors.green,
                        icon: Icons.verified,
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          // UrlLauncher.launch(
                          //     'tel:+${controller.getmemberDetailsData.value.data?[index].mobileNo}');
                        },
                        backgroundColor: colors.red,
                        icon: Icons.cancel,
                        foregroundColor: colors.white,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.MEMBERPROFILE, arguments: {
                        //   ArgumentConstant.userData: controller
                        //       .getmemberDetailsData.value.data?[index]
                        // });
                      },
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "navadiya chirag bhurabhai",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: colors.darkbrown,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "${StringConstant.mobile} : 9898399156",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "${StringConstant.address} : Amroli",
                                      style: TextStyle(
                                          fontSize: 12.5.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "${StringConstant.workdetails} : work",
                                      style: TextStyle(
                                          fontSize: 12.5.sp,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
