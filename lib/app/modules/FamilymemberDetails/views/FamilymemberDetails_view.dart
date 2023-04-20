import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../main.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/screens/loading_and_error_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../routes/app_pages.dart';
import '../../Memberprofile/controllers/Memberprofile_controller.dart';
import '../../memberDetails/controllers/memberDetails_controller.dart';
import '../controllers/Familymember_controller.dart';

class FamilyMemberView extends GetView<FamilyMemberController> {
  FamilyMemberView({Key? key}) : super(key: key);
  final usercontroller = Get.put(MemberProfileController());
  final familycontroller = Get.put(FamilyMemberController());


  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "${usercontroller.userData?.name?.toUpperCase()}",
            style: const TextStyle(),
          ),
          backgroundColor: colors.darkbrown,
          elevation: 0),
      body: GetBuilder<FamilyMemberController>(
        init: familycontroller,
        builder: (controller)=>Obx(() =>
              LoadingAndErrorScreen(
                  isLoading: controller.isLoading.value,
                  errorOccurred: controller.errorOccurred.value,
                  errorResolvingFunction: controller.familyMemberData,
                  child: ListView.builder(
                    itemCount: controller.familyMemberData.value.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  if (controller
                                      .familyMemberData.value.data?[index].rId ==
                                      box.read('userId')) {
                                    Get.toNamed(Routes.EditProfile,arguments: {
                                      ArgumentConstant.editprofiledata: controller.familyMemberData.value.data?[index]
                                    });
                                  } else {
                                    controller.openDilogueNotEdit(context: context);
                                  }
                                },
                                backgroundColor: colors.green,
                                icon: Icons.edit,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  if (controller
                                      .familyMemberData.value.data?[index].gender == "Male") {
                                    UrlLauncher.launch(
                                        'tel:+${controller.familyMemberData.value
                                            .data?[index].mobileNo}');
                                  } else {
                                    openDilogue(context: context);
                                  }
                                },
                                backgroundColor: colors.white,
                                icon: Icons.call,
                                foregroundColor: colors.darkbrown,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  if (controller
                                      .familyMemberData.value.data?[index].rId ==
                                      box.read('userId')|| box.read('isAdmin') =="1") {
                                    controller.openDilogueDelete(context: context,index: index);
                                  } else {
                                    controller.openDilogueNotDelete(context: context);
                                  }
                                },
                                backgroundColor: Color(0xFFFE4A49),
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.FAMILYMEMBERPROFILE,
                                    arguments: {
                                      ArgumentConstant.familyprofiledata: controller
                                          .familyMemberData.value.data?[index]
                                    });
                              },
                              child: Container(
                                // height: 120.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colors.lightgrey),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/userprofile.png"),
                                        radius: 35,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "${controller.familyMemberData.value
                                                  .data?[index].name} "
                                                  "${controller.familyMemberData
                                                  .value.data?[index]
                                                  .middleName} "
                                                  "${controller.familyMemberData
                                                  .value.data?[index].lastName}",
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  color: colors.darkbrown,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "${StringConstant
                                                  .mobile} : ${controller
                                                  .familyMemberData.value
                                                  .data?[index].mobileNo}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${StringConstant
                                                  .address} : ${controller
                                                  .familyMemberData.value
                                                  .data?[index].address}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${StringConstant
                                                  .workdetails} : ${controller
                                                  .familyMemberData.value
                                                  .data?[index].business}",
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
                        ),
                      );
                    },
                  )),
        ),
      ),
    );
  }

  openDilogue({required BuildContext context}) {
    MyColor colors = MyColor();
    return Get.dialog(Dialog(
      child: Container(
        width: 20.w,
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
            Text(
              "તમે કોઈ પણ સ્ત્રી ને કોલ કરી શકતા નથી",
              style: TextStyle(fontSize: 14.sp, color: colors.darkbrown),
            ),
            SizedBox(height: 2.h,),
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
}