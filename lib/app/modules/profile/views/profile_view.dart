import 'package:bhalala/app/constant/Color.dart';
import 'package:dart_quote/widget_quote.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../constant/shreprefrence.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    MyColor colors = MyColor();
    return GetBuilder<ProfileController>(
        init: profileController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colors.darkbrown,
              centerTitle: true,
              title: Text(StringConstant.bhalalaparivar),
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        // Get.to(EditProfileScreen());
                      },
                      icon: Icon(Icons.edit)),
                )
              ],
            ),
            body: Obx(
              () => SingleChildScrollView(
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
                        controller.userName.value,
                        style:
                            TextStyle(fontSize: 12.sp, color: colors.darkbrown),
                      ),
                    ),
                    profiletext(
                        icons: Icons.location_on,
                        heading: StringConstant.address,
                        text: controller.userAddress.value),
                    profiletext(
                        icons: FontAwesomeIcons.mobileScreen,
                        heading: StringConstant.mobile,
                        text: controller.userMobile.value),
                    profiletext(
                        icons: Icons.location_on,
                        heading: StringConstant.village,
                        text: "add"),
                    profiletext(
                        icons: FontAwesomeIcons.shop,
                        heading: StringConstant.workdetails,
                        text: "add"),
                    profiletext(
                        icons: Icons.email,
                        heading: StringConstant.emailId,
                        text: controller.userEmail.value),
                    profiletext(
                        icons: Icons.cake,
                        heading: StringConstant.birthdaydate,
                        text: "add"),
                    profiletext(
                        icons: FontAwesomeIcons.graduationCap,
                        heading: StringConstant.education,
                        text: "add"),
                    profiletext(
                        icons: Icons.group,
                        heading: StringConstant.gender,
                        text: "add"),
                    profiletext(
                        icons: Icons.location_on,
                        heading: StringConstant.home,
                        text: "add"),
                    profiletext(
                        icons: FontAwesomeIcons.personCircleCheck,
                        heading: StringConstant.merrige_status,
                        text: "add"),
                    profiletext(
                        icons: Icons.person,
                        heading: StringConstant.age,
                        text: "add"),
                    profiletext(
                        icons: FontAwesomeIcons.person,
                        heading: StringConstant.bloodgroup,
                        text: "add"),
                    profiletext(
                        icons: Icons.group,
                        heading: StringConstant.member_count,
                        text: "add"),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(AddNewmemberScreen());
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
          );
        });
  }
}
