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
import '../model/profileModel.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.EditProfile, arguments: {
                            ArgumentConstant.editprofiledata:
                                controller.userProfileData.value.data?.first
                          });
                        },
                        icon: const Icon(Icons.edit)),
                  )
                ],
              ), ////
              body: SingleChildScrollView(
                child: FutureBuilder<Profilemodel>(
                    future: controller.userProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: colors.darkbrown,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "મેહરબાની કરી ને રાહ જોવો",
                                      style: TextStyle(fontSize: 14.sp),
                                    )
                                  ],
                                )
                            ));
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Flexible(
                                child: Text(
                                  "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: colors.darkbrown, fontSize: 14.sp),
                                ),
                              ),
                            ));
                      } else {
                        return Column(
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
                                        child:  SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(200),
                                            child: Image.network(
                                              "${snapshot.data?.data?.first.userProfile}",
                                              fit: BoxFit.cover,
                                              errorBuilder: (a, b, c) => Image.asset(
                                                  'assets/images/userprofile.png'),
                                            ),
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
                                "${snapshot.data?.data?.first.name} ${snapshot.data?.data?.first.middleName} ${snapshot.data?.data?.first.lastName}",
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
                                text: snapshot.data?.data?.first.address),
                            profiletext(
                                icons: FontAwesomeIcons.mobileScreen,
                                heading: StringConstant.mobile,
                                text: snapshot.data?.data?.first.mobileNo),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.village,
                                text: snapshot.data?.data?.first.vId),
                            profiletext(
                                icons: FontAwesomeIcons.shop,
                                heading: StringConstant.workdetails,
                                text: snapshot.data?.data?.first.business),
                            profiletext(
                                icons: Icons.email,
                                heading: StringConstant.emailId,
                                text: snapshot.data?.data?.first.emailed),
                            profiletext(
                                icons: Icons.cake,
                                heading: StringConstant.birthdaydate,
                                text: snapshot.data?.data?.first.birthdate),
                            profiletext(
                                icons: FontAwesomeIcons.graduationCap,
                                heading: StringConstant.education,
                                text: snapshot.data?.data?.first.educationId),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.gender,
                                text: snapshot.data?.data?.first.gender),
                            profiletext(
                                icons: Icons.location_on,
                                heading: StringConstant.home,
                                text: snapshot.data?.data?.first.homeId),
                            profiletext(
                                icons: FontAwesomeIcons.personCircleCheck,
                                heading: StringConstant.merrige_status,
                                text: snapshot.data?.data?.first.homeId),
                            profiletext(
                                icons: Icons.person,
                                heading: StringConstant.age,
                                text: snapshot.data?.data?.first.age),
                            profiletext(
                                icons: FontAwesomeIcons.person,
                                heading: StringConstant.bloodgroup,
                                text: snapshot.data?.data?.first.bName),
                            profiletext(
                                icons: Icons.group,
                                heading: StringConstant.member_count,
                                text: snapshot.data?.data?.first.noOfMember),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.FAMILYMEMBER,
                                    arguments: {
                                      ArgumentConstant.memberId:
                                      controller
                                          .userProfileData.value.data?.first.rId
                                    });
                                // Get.toNamed(Routes.FAMILYMEMBER,
                                //     arguments: controller
                                //         .userProfileData.value.data?.first.rId??'');
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
                        );
                      }
                    }),
              ),
            ),
          );
        });
  }
}
