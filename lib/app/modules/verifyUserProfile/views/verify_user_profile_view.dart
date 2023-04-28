import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../controllers/verify_user_profile_controller.dart';

class VerifyUserProfileView extends GetView<VerifyUserProfileController> {
  VerifyUserProfileView({Key? key}) : super(key: key);
  final verifyuserController = Get.put(VerifyUserProfileController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return GetBuilder<VerifyUserProfileController>(
        init: verifyuserController,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: colors.darkbrown,
              centerTitle: true,
              title: Text(StringConstant.bhalalaparivar),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 3,
                    child: Stack(
                      children: [
                        Container(
                            height: 10.h,
                            width: 100.w,
                            child: Image.asset(
                              "assets/images/bg.png",
                              fit: BoxFit.fill,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: 50.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                      'assets/images/userprofile.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: Text(
                      // "${controller.userName.value.toUpperCase()} ${controller.usermiddle.value.toUpperCase()} ${controller.userLastName.value.toUpperCase()}",
                      "${controller.statusData?.name} ${controller.statusData?.middleName} ${controller.statusData?.lastName}",
                      style:
                          TextStyle(fontSize: 12.sp, color: colors.darkbrown),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  profiletext(
                      icons: Icons.location_on,
                      heading: StringConstant.address,
                      text: controller.statusData?.address),
                  profiletext(
                      icons: FontAwesomeIcons.mobileScreen,
                      heading: StringConstant.mobile,
                      text: controller.statusData?.mobileNo),
                  profiletext(
                      icons: Icons.location_on,
                      heading: StringConstant.village,
                      text: controller.statusData?.vId),
                  profiletext(
                      icons: FontAwesomeIcons.shop,
                      heading: StringConstant.workdetails,
                      text: controller.statusData?.business),
                  profiletext(
                      icons: Icons.email,
                      heading: StringConstant.emailId,
                      text: controller.statusData?.emailed),
                  profiletext(
                      icons: Icons.cake,
                      heading: StringConstant.birthdaydate,
                      text: controller.statusData?.birthdate),
                  profiletext(
                      icons: FontAwesomeIcons.graduationCap,
                      heading: StringConstant.education,
                      text: controller.statusData?.educationId),
                  profiletext(
                      icons: Icons.group,
                      heading: StringConstant.gender,
                      text: controller.statusData?.gender),
                  profiletext(
                      icons: Icons.location_on,
                      heading: StringConstant.home,
                      text: controller.statusData?.homeId),
                  profiletext(
                      icons: FontAwesomeIcons.personCircleCheck,
                      heading: StringConstant.merrige_status,
                      text: controller.statusData?.marriedId),
                  profiletext(
                      icons: Icons.person,
                      heading: StringConstant.age,
                      text: controller.statusData?.age),
                  profiletext(
                      icons: FontAwesomeIcons.person,
                      heading: StringConstant.bloodgroup,
                      text: controller.statusData?.bName),
                  profiletext(
                      icons: Icons.group,
                      heading: StringConstant.member_count,
                      text: controller.statusData?.noOfMember),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "User Documents",
                      style:
                          TextStyle(color: colors.darkbrown, fontSize: 14.sp),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       height: 30.h,
                  //       width: 50.h,
                  //
                  //       child: PhotoView(
                  //         basePosition: Alignment.topLeft,
                  //         backgroundDecoration: BoxDecoration(color: colors.white),
                  //         imageProvider: NetworkImage(
                  //           "${controller.statusData?.userProfile}",
                  //         ),
                  //       )),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        _ImageDialogue(context: context);
                      },
                      child: SizedBox(
                        // alignment: Alignment.center,
                        height: 20.h,
                        width: 30.h,
                        child: Image.network(
                          "${controller.statusData?.userProfile}",
                          fit: BoxFit.cover,
                          errorBuilder: (a, b, c) =>
                              Image.asset('assets/images/userprofile.png'),
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     // Get.toNamed(Routes.FAMILYMEMBER,arguments: controller.searchuserData?.rId);
                  //   },
                  //   child: Center(
                  //     child: Container(
                  //       height: 6.h,
                  //       width: 90.w,
                  //       decoration: BoxDecoration(
                  //           color: colors.darkbrown,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Center(
                  //           child: Text(
                  //             "સભ્ય ની વિગત જોવો",
                  //             style: TextStyle(
                  //                 color: colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 13.sp),
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
  _ImageDialogue({required context}){
    return  Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 50.h,
        width: 100.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhotoView(
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                  imageProvider: NetworkImage(
                    "${controller.statusData?.userProfile}",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
