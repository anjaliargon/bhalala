import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/no_internet/check_network.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    MyColor colors = MyColor();
    return GetBuilder<ProfileController>(
        init: profileController,
        builder: (controller) {
          return CheckNetwork(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: colors.darkbrown,
                centerTitle: true,
                title: Text(StringConstant.bhalalaparivar),
                actions: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.EditProfile, arguments: {
                            ArgumentConstant.editprofiledata:
                                controller.userProfileData.value.data?.first
                          });
                        },
                        icon: Icon(Icons.edit)),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Obx(()=> Column(
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
                          "${controller.userProfileData.value.data?.first.name ?? ''} ${controller.userProfileData.value.data?.first.middleName ?? ''} ${controller.userProfileData.value.data?.first.lastName ?? ''}",
                          style:
                              TextStyle(fontSize: 14.sp, color: colors.darkbrown),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.address,
                          text: controller
                                  .userProfileData.value.data?.first.address ??
                              ''),
                      profiletext(
                          icons: FontAwesomeIcons.mobileScreen,
                          heading: StringConstant.mobile,
                          text: controller
                                  .userProfileData.value.data?.first.mobileNo ??
                              ''),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.village,
                          text:
                              controller.userProfileData.value.data?.first.vId ??
                                  ''),
                      profiletext(
                          icons: FontAwesomeIcons.shop,
                          heading: StringConstant.workdetails,
                          text: controller
                                  .userProfileData.value.data?.first.business ??
                              ''),
                      profiletext(
                          icons: Icons.email,
                          heading: StringConstant.emailId,
                          text: controller
                                  .userProfileData.value.data?.first.emailed ??
                              ''),
                      profiletext(
                          icons: Icons.cake,
                          heading: StringConstant.birthdaydate,
                          text: controller
                                  .userProfileData.value.data?.first.birthdate ??
                              ''),
                      profiletext(
                          icons: FontAwesomeIcons.graduationCap,
                          heading: StringConstant.education,
                          text: controller.userProfileData.value.data?.first
                                  .educationId ??
                              ''),
                      profiletext(
                          icons: Icons.group,
                          heading: StringConstant.gender,
                          text: controller
                                  .userProfileData.value.data?.first.gender ??
                              ''),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.home,
                          text: controller
                                  .userProfileData.value.data?.first.homeId ??
                              ''),
                      profiletext(
                          icons: FontAwesomeIcons.personCircleCheck,
                          heading: StringConstant.merrige_status,
                          text: controller
                                  .userProfileData.value.data?.first.marriedId ??
                              ''),
                      profiletext(
                          icons: Icons.person,
                          heading: StringConstant.age,
                          text:
                              controller.userProfileData.value.data?.first.age ??
                                  ''),
                      profiletext(
                          icons: FontAwesomeIcons.person,
                          heading: StringConstant.bloodgroup,
                          text: controller
                                  .userProfileData.value.data?.first.bName ??
                              ''),
                      profiletext(
                          icons: Icons.group,
                          heading: StringConstant.member_count,
                          text: controller
                                  .userProfileData.value.data?.first.noOfMember ??
                              ''),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FAMILYMEMBER,
                              // arguments: controller.userData?.rId
                              arguments:  controller.userProfileData.value.data?.first.rId);
                        },
                        child: Center(
                          child: Container(
                            height: 6.h,
                            width: 95.w,
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
                        height: 1.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ADDMEMBER);
                        },
                        child: Center(
                          child: Container(
                            height: 6.h,
                            width: 95.w,
                            decoration: BoxDecoration(
                                color: colors.darkbrown,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              StringConstant.addnew_member,
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
