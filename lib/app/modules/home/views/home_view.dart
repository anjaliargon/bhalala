import 'package:bhalala/app/constant/Color.dart';
import 'package:dart_quote/widget_quote.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../constant/shreprefrence.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      drawer: Drawer(
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
                      },
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/userprofile.png"),
                        radius: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              controller.userName.value,
                              style: TextStyle(color: colors.white),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Obx(
                            () => Text(
                              controller.userEmail.value,
                              style: TextStyle(color: colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            ListTile(
              title: Text(
                StringConstant.gamniyadi,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.home,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.VILLAGE);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.parivarvise,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.group,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.ABOUT_FAMILY);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.parivar_karyalay,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.watch_later_rounded,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Get.toNamed(Routes.PARIVARKARAYALAY);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.parivar_samiti,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.groups,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.COMITEE);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.search_member,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.search,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.photo_gallary,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.photo,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.important_number,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.phone,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.IMP_NUMBER);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.suchna_number,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.phone,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.NOTICE);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.applicationhlpline,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.home,
                color: colors.darkbrown,
              ),
              onTap: () {
                // Get.toNamed(Routes.APP_HELPLINE);
              },
            ),
            ListTile(
              title: Text(
                StringConstant.logout,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.logout,
                color: colors.darkbrown,
              ),
              onTap: () {
                Fluttertoast.showToast(msg: "Logout Successfully!");
                MySharedPreferences().logout();
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
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 4),
              child: WidgetQuote(
                      text: StringConstant.mainheading,
                      quoteStyle:
                          TextStyle(color: colors.darkbrown, fontSize: 15.sp),
                      textStyle: TextStyle(
                          color: colors.darkbrown,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold))
                  .quote()),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.VILLAGE);
                  },
                  child: _container(StringConstant.gamniyadi, Icons.home),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.ABOUT_FAMILY);
                  },
                  child: _container(StringConstant.parivarvise, Icons.group),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.COMITEE);
                  },
                  child:
                      _container(StringConstant.parivar_samiti, Icons.groups),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.VILLAGE);
                  },
                  child: _container(StringConstant.search_member, Icons.search),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.VILLAGE);
                  },
                  child: _container(StringConstant.photo_gallary, Icons.photo),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.PARIVARKARAYALAY);
                  },
                  child: _container(StringConstant.suchna_number, Icons.home),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.VILLAGE);
                  },
                  child: _container(StringConstant.parivarsahyoug, Icons.group),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.IMP_NUMBER);
                  },
                  child:
                      _container(StringConstant.important_number, Icons.call),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.PARIVARKARAYALAY);
                  },
                  child: _container(StringConstant.parivar_karyalay,
                      Icons.watch_later_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _container(String title, IconData icon) {
    MyColor colors = MyColor();
    return Padding(
      padding: const EdgeInsets.only(right: 4, top: 8, left: 4),
      child: Container(
        height: 19.h,
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
              size: 25.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
