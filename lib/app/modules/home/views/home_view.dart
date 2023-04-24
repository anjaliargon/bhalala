import 'package:bhalala/app/constant/Color.dart';
import 'package:bhalala/app/constant/screens/loading_and_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../main.dart';
import '../../../constant/String_constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) => Scaffold(
        drawer: (box.read("userId")=="81")?
        Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: colors.darkbrown,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PROFILE);
                          // profileController.userProfile(box.read('userId'));
                        },
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/userprofile.png"),
                          radius: 35,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Text(
                                  "${controller.userName.value.toUpperCase()} ${controller.usermiddle.value.toUpperCase()} ${controller.userLastName.value.toUpperCase()}",
                                  style: TextStyle(color: colors.white),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Obx(
                                    () => Flexible(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    controller.userEmail.value,
                                    style: TextStyle(
                                        color: colors.white, fontSize: 11.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              ListTile(
                title: Text(
                  StringConstant.parivarverifay,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.verified,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.FAMILY_ADD);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.gamniyadi,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.home,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.VILLAGE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivarvise,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.group,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.ABOUT_FAMILY);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivar_karyalay1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.watch_later_rounded,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.PARIVARKARAYALAY);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivar_samiti1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.groups,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.FAMILY_SAMITI);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.search_member,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.search,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.SEARCH);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.photo_gallary,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.photo,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.PHOTO);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.important_number1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.phone,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.IMP_NUMBER);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.suchna_number,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.phone,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.NOTICE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.applicationhlpline,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.home,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Get.toNamed(Routes.APP_HELPLINE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.logout,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.logout,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: "Logout Successfully!");
                  box.erase();
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ):
        Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: colors.darkbrown,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PROFILE);
                          // profileController.userProfile(box.read('userId'));
                        },
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/userprofile.png"),
                          radius: 35,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Text(
                                  "${controller.userName.value.toUpperCase()} ${controller.usermiddle.value.toUpperCase()} ${controller.userLastName.value.toUpperCase()}",
                                  style: TextStyle(color: colors.white),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Obx(
                                    () => Flexible(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    controller.userEmail.value,
                                    style: TextStyle(
                                        color: colors.white, fontSize: 11.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              ListTile(
                title: Text(
                  StringConstant.gamniyadi,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.home,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.VILLAGE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivarvise,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.group,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.ABOUT_FAMILY);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivar_karyalay1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.watch_later_rounded,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.PARIVARKARAYALAY);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.parivar_samiti1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.groups,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.FAMILY_SAMITI);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.search_member,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.search,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.SEARCH);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.photo_gallary,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.photo,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Get.toNamed(Routes.PHOTO);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.important_number1,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.phone,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.IMP_NUMBER);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.suchna_number,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.phone,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Get.toNamed(Routes.NOTICE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.applicationhlpline,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.home,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  // Get.toNamed(Routes.APP_HELPLINE);
                },
              ),
              ListTile(
                title: Text(
                  StringConstant.logout,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.logout,
                  color: colors.darkbrown,
                  size: 20.sp,
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: "Logout Successfully!");
                  box.erase();
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
            title: Text(
              StringConstant.bhalalaparivar,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: colors.darkbrown,
            elevation: 0),
        body: LoadingAndErrorScreen(
          isLoading: controller.isLoading.value,
          errorOccurred: controller.errorOccurred.value,
          errorResolvingFunction: controller.getUserData,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 4),
                child: Text(
                  StringConstant.mainheading,
                  style: TextStyle(
                      color: colors.darkbrown,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    StringConstant.mainheading2,
                    style: TextStyle(
                        color: colors.darkbrown,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.VILLAGE);
                      },
                      child: _container(StringConstant.gamniyadi, Icons.home),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ABOUT_FAMILY);
                      },
                      child:
                          _container(StringConstant.parivarvise, Icons.group),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FAMILY_SAMITI);
                      },
                      child: _container(
                          StringConstant.parivar_samiti, Icons.groups),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SEARCH);
                      },
                      child: _container(
                          StringConstant.search_member, Icons.search),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PHOTO);
                      },
                      child:
                          _container(StringConstant.photo_gallary, Icons.photo),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.NOTICE);
                      },
                      child:
                          _container(StringConstant.suchna_number, Icons.developer_board),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PARIVAR_SAHYOG);
                      },
                      child: _container(
                          StringConstant.parivarsahyoug, Icons.group),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.IMP_NUMBER);
                      },
                      child: _container(
                          StringConstant.important_number, Icons.call),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PARIVARKARAYALAY);
                      },
                      child: _container(StringConstant.parivar_karyalay,
                          Icons.watch_later_outlined),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  _container(String title, IconData icon) {
    MyColor colors = MyColor();
    return Padding(
      padding: const EdgeInsets.only(right: 4, top: 8, left: 4),
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
          color: colors.lightgrey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colors.darkbrown,
              size: 27.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
