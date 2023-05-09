import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/screens/loading_and_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../../../constant/Widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/searchMemberprofile_controller.dart';

class SearchProfileView extends GetView<SearchProfileController> {
  const SearchProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(SearchProfileController());

    MyColor colors = MyColor();
    return GetBuilder<SearchProfileController>(
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
                          "${controller.searchuserData?.name} ${controller.searchuserData?.middleName} ${controller.searchuserData?.lastName}",
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
                          text:controller.searchuserData?.address),
                      profiletext(
                          icons: FontAwesomeIcons.mobileScreen,
                          heading: StringConstant.mobile,
                          text:controller.searchuserData?.mobileNo),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.village,
                          text: controller.searchuserData?.vId),
                      profiletext(
                          icons: FontAwesomeIcons.shop,
                          heading: StringConstant.workdetails,
                          text: controller.searchuserData?.business),
                      profiletext(
                          icons: Icons.email,
                          heading: StringConstant.emailId,
                          text: controller.searchuserData?.emailed),
                      profiletext(
                          icons: Icons.cake,
                          heading: StringConstant.birthdaydate,
                          text: controller.searchuserData?.birthdate),
                      profiletext(
                          icons: FontAwesomeIcons.graduationCap,
                          heading: StringConstant.education,
                          text:controller.searchuserData?.educationId),
                      profiletext(
                          icons: Icons.group,
                          heading: StringConstant.gender,
                          text: controller.searchuserData?.gender),
                      profiletext(
                          icons: Icons.location_on,
                          heading: StringConstant.home,
                          text:controller.searchuserData?.homeId),
                      profiletext(
                          icons: FontAwesomeIcons.personCircleCheck,
                          heading: StringConstant.merrige_status,
                          text: controller.searchuserData?.marriedId),
                      profiletext(
                          icons: Icons.person,
                          heading: StringConstant.age,
                          text:controller.searchuserData?.age),
                      profiletext(
                          icons: FontAwesomeIcons.person,
                          heading: StringConstant.bloodgroup,
                          text:controller.searchuserData?.bName),
                      profiletext(
                          icons: Icons.group,
                          heading: StringConstant.member_count,
                          text: controller.searchuserData?.noOfMember??''),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FAMILYMEMBER,arguments: {
                            ArgumentConstant.memberId:controller.searchuserData?.rId,
                          });
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
