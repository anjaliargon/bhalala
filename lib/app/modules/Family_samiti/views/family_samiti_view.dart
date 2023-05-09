import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/String_constant.dart';
import '../../../no_internet/check_network.dart';
import '../controllers/family_samiti_controller.dart';
import '../samitiModel.dart';

class FamilySamitiView extends GetWidget<FamilySamitiController> {
  const FamilySamitiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return CheckNetwork(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colors.darkbrown,
          title: Text(StringConstant.parivar_samiti1),
        ),
        body: FutureBuilder<Parivarsamiti>(
            future: controller.getSamitiData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
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
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    child: Text(
                      "Error: ${snapshot.error}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: colors.darkbrown, fontSize: 14.sp),
                    ),
                  ),
                ));
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.sthapakList.first.samityTypeName.toString(),
                                style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.sthapakList.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.sthapakList[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.sthapakList[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                            c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.sthapakList[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                            FontWeight
                                                                .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.sthapakList[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                          colors.darkbrown,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.sthapakList[index].phone}",
                                                    style:
                                                        const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.karobariList.first.samityTypeName.toString(),
                                style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.karobariList.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.karobariList[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.karobariList[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                            c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.karobariList[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                            FontWeight
                                                                .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.karobariList[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                          colors.darkbrown,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.karobariList[index].phone}",
                                                    style:
                                                        const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.samiti4.first.samityTypeName.toString(),
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.samiti4.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.samiti4[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.samiti4[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                        c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.samiti4[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.samiti4[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                      colors.darkbrown,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.samiti4[index].phone}",
                                                    style:
                                                    const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.samiti5.first.samityTypeName.toString(),
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.samiti5.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.samiti5[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.samiti5[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                        c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.samiti5[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.samiti5[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                      colors.darkbrown,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.samiti5[index].phone}",
                                                    style:
                                                    const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.samiti6.first.samityTypeName.toString(),
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.samiti6.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.samiti6[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.samiti6[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                        c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.samiti6[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.samiti6[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                      colors.darkbrown,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.samiti6[index].phone}",
                                                    style:
                                                    const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.samiti7.first.samityTypeName.toString(),
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.samiti6.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.samiti7[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.samiti7[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                        c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.samiti7[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.samiti7[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                      colors.darkbrown,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.samiti7[index].phone}",
                                                    style:
                                                    const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 5.h,
                              width: double.infinity,
                              color: colors.darkbrown,
                              child: Center(
                                  child: Text(
                                    controller.samiti8.first.samityTypeName.toString(),
                                    style: TextStyle(
                                        color: colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  )),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.samiti8.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          launchUrl(Uri.parse('tel:${controller.samiti8[index].phone}'));
                                        },
                                        backgroundColor: colors.green,
                                        icon: Icons.call,
                                        foregroundColor: colors.darkbrown,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colors
                                                              .darkbrown)),
                                                  child: Image.network(
                                                    "${controller.samiti8[index].picture}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (a, b,
                                                        c) =>
                                                        Image.asset(
                                                            'assets/images/userprofile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "${controller.samiti8[index].villageName}",
                                                    style: TextStyle(
                                                        color: colors
                                                            .darkbrown,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.samiti8[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color:
                                                      colors.darkbrown,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                    "મોબાઇલ નંબર :${controller.samiti8[index].phone}",
                                                    style:
                                                    const TextStyle()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        height: 1,
                                        color: colors.darkbrown,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
