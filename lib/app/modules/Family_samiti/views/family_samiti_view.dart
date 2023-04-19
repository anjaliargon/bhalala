import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../controllers/family_samiti_controller.dart';

class FamilySamitiView extends GetView<FamilySamitiController> {
  FamilySamitiView({Key? key}) : super(key: key);
  FamilySamitiController samitiController = Get.put(FamilySamitiController());
  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return GetBuilder(
      init: samitiController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: colors.darkbrown,
              title: Text(StringConstant.parivar_samiti1),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: colors.lightgrey,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 12.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: colors.darkbrown)),
                            child: Image.asset(
                              "assets/images/p1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              StringConstant.ravajibhai,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: colors.darkbrown,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(StringConstant.main,
                              style: TextStyle(color: colors.darkbrown)),
                          Text(StringConstant.village_ravaji,
                              style: TextStyle(color: colors.darkbrown)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: colors.lightgrey,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 12.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: colors.darkbrown)),
                            child: Image.asset(
                              "assets/images/p2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              StringConstant.ravajibhai,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: colors.darkbrown,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(StringConstant.main,
                              style: TextStyle(color: colors.darkbrown)),
                          Text(StringConstant.village_ravaji,
                              style: TextStyle(color: colors.darkbrown)),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 5.h,
                          width: double.infinity,
                          color: colors.darkbrown,
                          child: Center(
                              child: Text(
                                "સ્થાપક સમિતિ",
                                style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )),
                        ),
                        ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      UrlLauncher.launch(
                                          'tel:+${controller.samitiData.value.data![index].phone}');
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
                                                      color: colors.darkbrown)),
                                              child: Image.asset(
                                                controller.samitiData.value.data?[index].picture??'',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                controller.samitiData.value.data?[index].role ??'',
                                                style: TextStyle(
                                                    color: colors.darkbrown,
                                                    fontWeight:
                                                    FontWeight.bold)),
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
                                              controller.samitiData.value.data![index].name??'',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: colors.darkbrown,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                "મોબાઇલ નંબર :${controller.samitiData.value.data![index].phone}",
                                                style: const TextStyle()),
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
                                "કારોબારી સમિતિ",
                                style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ListView.builder(
                          itemCount: 14,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      UrlLauncher.launch(
                                          'tel:+${controller.samitiData.value.data![index+15].phone}');
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
                                                      color: colors.darkbrown)),
                                              child: Image.asset(
                                                controller.samitiData.value.data![index+15].picture ??'',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                controller.samitiData.value.data![index+15].role ??'',
                                                style: TextStyle(
                                                    color: colors.darkbrown,
                                                    fontWeight:
                                                    FontWeight.bold)),
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
                                              controller.samitiData.value.data![index+15].name??'',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: colors.darkbrown,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                "મોબાઇલ નંબર :${controller.samitiData.value.data![index+15].phone}",
                                                style: const TextStyle()),
                                            Text(
                                                "હોદ્દો  :${controller.samitiData.value.data![index+15].role}",
                                                style: const TextStyle()),
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
                                "સંકલન સમિતિ",
                                style: TextStyle(
                                    color: colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ListView.builder(
                          itemCount: 29,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      UrlLauncher.launch(
                                          'tel:+${controller.samitiData.value.data![index+29].phone}');
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
                                                      color: colors.darkbrown)),
                                              child: Image.asset(
                                                controller.samitiData.value.data![index+29].picture??'',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                controller.samitiData.value.data![index+29].role??'',
                                                style: TextStyle(
                                                    color: colors.darkbrown,
                                                    fontWeight:
                                                    FontWeight.bold)),
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
                                              controller.samitiData.value.data![index+29].name??'',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: colors.darkbrown,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                                "મોબાઇલ નંબર :${controller.samitiData.value.data![index+29].phone}",
                                                style: const TextStyle()),
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}