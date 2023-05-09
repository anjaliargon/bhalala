import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/screens/loading_and_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../controllers/FamilyMemberprofile_controller.dart';

class FamilyMemberProfileView extends GetView<FamilyMemberProfileController> {
  const FamilyMemberProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(FamilyMemberProfileController());

    MyColor colors = MyColor();
    return GetBuilder<FamilyMemberProfileController>(
        init: profileController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colors.darkbrown,
              centerTitle: true,
              title: Text(StringConstant.bhalalaparivar),
            ),
            body: Obx(
              () => LoadingAndErrorScreen(
                isLoading: controller.isLoading.value,
                errorOccurred: controller.errorOccurred.value,
                errorResolvingFunction: profileController.isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 3,
                        child: Stack(
                          children: [
                            SizedBox(
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
                          "${controller.FamilyuserData?.name} ${controller.FamilyuserData?.middleName} ${controller.FamilyuserData?.lastName}",
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
                          text:controller.FamilyuserData?.address),
                      profiletext(
                          icons: FontAwesomeIcons.mobileScreen,
                          heading: StringConstant.mobile,
                          text:controller.FamilyuserData?.mobileNo),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.village,
                          text: controller.FamilyuserData?.vId),
                      profiletext(
                          icons: FontAwesomeIcons.shop,
                          heading: StringConstant.workdetails,
                          text: controller.FamilyuserData?.business),
                      profiletext(
                          icons: Icons.email,
                          heading: StringConstant.emailId,
                          text: controller.FamilyuserData?.emailed),
                      profiletext(
                          icons: Icons.cake,
                          heading: StringConstant.birthdaydate,
                          text: controller.FamilyuserData?.birthdate),
                      profiletext(
                          icons: FontAwesomeIcons.graduationCap,
                          heading: StringConstant.education,
                          text:controller.FamilyuserData?.educationId),
                      profiletext(
                          icons: Icons.group,
                          heading: StringConstant.gender,
                          text: controller.FamilyuserData?.gender),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.home,
                          text:controller.FamilyuserData?.homeId),
                      profiletext(
                          icons: FontAwesomeIcons.personCircleCheck,
                          heading: StringConstant.merrige_status,
                          text: controller.FamilyuserData?.marriedId),
                      profiletext(
                          icons: Icons.person,
                          heading: StringConstant.age,
                          text:controller.FamilyuserData?.age),
                      profiletext(
                          icons: FontAwesomeIcons.person,
                          heading: StringConstant.bloodgroup,
                          text:controller.FamilyuserData?.bName),
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
