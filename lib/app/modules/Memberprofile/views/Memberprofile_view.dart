import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/screens/loading_and_error_screen.dart';
import 'package:bhalala/app/modules/profile/controllers/profile_controller.dart';
import 'package:bhalala/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../main.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../controllers/Memberprofile_controller.dart';

class MemberProfileView extends GetView<MemberProfileController> {
  const MemberProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memberprofileController = Get.put(MemberProfileController());
    final profileController = Get.put(ProfileController());

    MyColor colors = MyColor();
    return GetBuilder<MemberProfileController>(
        init: memberprofileController,
        builder: (controller) {
          return (box.read('userId') == controller.userData?.rId)
              ? Scaffold(
                  appBar: AppBar(
                    backgroundColor: colors.darkbrown,
                    centerTitle: true,
                    title: Text(StringConstant.bhalalaparivar),
                    actions: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.EditProfile,
                                  arguments: {
                                ArgumentConstant.editprofiledata:
                                profileController.userProfileData.value.data?.first
                              });
                            },
                            icon: Icon(Icons.edit)),
                      )
                    ],
                  ),
                  body: Obx(
                    () => LoadingAndErrorScreen(
                      isLoading: controller.isLoading.value,
                      errorOccurred: controller.errorOccurred.value,
                      errorResolvingFunction: memberprofileController.isLoading,
                      child: SingleChildScrollView(
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
                                            borderRadius:
                                                BorderRadius.circular(100.0),
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
                                "${controller.userData?.name} ${controller.userData?.middleName} ${controller.userData?.lastName}",
                                style: TextStyle(
                                    fontSize: 14.sp, color: colors.darkbrown),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.address,
                                text: controller.userData?.address),
                            profiletext(
                                icons: FontAwesomeIcons.mobileScreen,
                                heading: StringConstant.mobile,
                                text: controller.userData?.mobileNo),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.village,
                                text: controller.userData?.vId),
                            profiletext(
                                icons: FontAwesomeIcons.shop,
                                heading: StringConstant.workdetails,
                                text: controller.userData?.business),
                            profiletext(
                                icons: Icons.email,
                                heading: StringConstant.emailId,
                                text: controller.userData?.emailed),
                            profiletext(
                                icons: Icons.cake,
                                heading: StringConstant.birthdaydate,
                                text: controller.userData?.birthdate),
                            profiletext(
                                icons: FontAwesomeIcons.graduationCap,
                                heading: StringConstant.education,
                                text: controller.userData?.educationId),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.gender,
                                text: controller.userData?.gender),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.home,
                                text: controller.userData?.homeId),
                            profiletext(
                                icons: FontAwesomeIcons.personCircleCheck,
                                heading: StringConstant.merrige_status,
                                text: controller.userData?.marriedId),
                            profiletext(
                                icons: Icons.person,
                                heading: StringConstant.age,
                                text: controller.userData?.age),
                            profiletext(
                                icons: FontAwesomeIcons.person,
                                heading: StringConstant.bloodgroup,
                                text: controller.userData?.bName),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.member_count,
                                text: controller.userData?.noOfMember),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ADDMEMBER);
                              },
                              child: Center(
                                child: Container(
                                  height: 6.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      color: colors.darkbrown,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                        "સભ્ય ઉમેરો ",
                                        style: TextStyle(
                                            color: colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.FAMILYMEMBER,
                                    arguments: controller.userData?.rId);
                              },
                              child: Center(
                                child: Container(
                                  height: 6.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      color: colors.darkbrown,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "સભ્ય ની વિગત જોવો",
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: colors.darkbrown,
                    centerTitle: true,
                    title: Text(StringConstant.bhalalaparivar),
                  ),
                  body: Obx(
                    () => LoadingAndErrorScreen(
                      isLoading: controller.isLoading.value,
                      errorOccurred: controller.errorOccurred.value,
                      errorResolvingFunction: memberprofileController.isLoading,
                      child: SingleChildScrollView(
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
                                            borderRadius:
                                                BorderRadius.circular(100.0),
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
                                "${controller.userData?.name} ${controller.userData?.middleName} ${controller.userData?.lastName}",
                                style: TextStyle(
                                    fontSize: 14.sp, color: colors.darkbrown),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.address,
                                text: controller.userData?.address),
                            profiletext(
                                icons: FontAwesomeIcons.mobileScreen,
                                heading: StringConstant.mobile,
                                text: controller.userData?.mobileNo),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.village,
                                text: controller.userData?.vId),
                            profiletext(
                                icons: FontAwesomeIcons.shop,
                                heading: StringConstant.workdetails,
                                text: controller.userData?.business),
                            profiletext(
                                icons: Icons.email,
                                heading: StringConstant.emailId,
                                text: controller.userData?.emailed),
                            profiletext(
                                icons: Icons.cake,
                                heading: StringConstant.birthdaydate,
                                text: controller.userData?.birthdate),
                            profiletext(
                                icons: FontAwesomeIcons.graduationCap,
                                heading: StringConstant.education,
                                text: controller.userData?.educationId),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.gender,
                                text: controller.userData?.gender),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.home,
                                text: controller.userData?.homeId),
                            profiletext(
                                icons: FontAwesomeIcons.personCircleCheck,
                                heading: StringConstant.merrige_status,
                                text: controller.userData?.marriedId),
                            profiletext(
                                icons: Icons.person,
                                heading: StringConstant.age,
                                text: controller.userData?.age),
                            profiletext(
                                icons: FontAwesomeIcons.person,
                                heading: StringConstant.bloodgroup,
                                text: controller.userData?.bName),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.member_count,
                                text: controller.userData?.noOfMember),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.FAMILYMEMBER,
                                    arguments: controller.userData?.rId);
                              },
                              child: Center(
                                child: Container(
                                  height: 6.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      color: colors.darkbrown,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "સભ્ય ની વિગત જોવો",
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
