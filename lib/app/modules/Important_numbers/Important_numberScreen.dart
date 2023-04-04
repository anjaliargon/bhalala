import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';
import 'numbersController.dart';

class ImportantNumber_Screen extends StatelessWidget {
  ImportantNumber_Screen({Key? key}) : super(key: key);
  final numberController = Get.put(NumberController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.important_number1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: double.infinity,
              color: colors.darkbrown,
              child: Center(
                  child: Text(
                "સુરત",
                style: TextStyle(
                    color: colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              )),
            ),
            ListView.builder(
              itemCount: 13,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colors.lightgrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 14.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                numberController.getDataList[index].name,
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Number : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                 "${numberController.getDataList[index].number}",
                                  // textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
                "રક્તદાનકેન્દ્ર /હોસ્પિટલ",
                style: TextStyle(
                    color: colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              )),
            ),
            ListView.builder(
              itemCount: 12,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colors.lightgrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 14.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                numberController.getDataList[index + 13].name,
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Number : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text("${numberController.getDataList[index + 13].number}",
                                  // textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
                "સમગ્ર ગુજરાત",
                style: TextStyle(
                    color: colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              )),
            ),
            ListView.builder(
              itemCount: 11,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colors.lightgrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 14.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                  numberController.getDataList[index + 25].name,
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Number : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                  "${numberController.getDataList[index + 25].number}",
                                  // textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
                    "સમગ્ર ભારત",
                    style: TextStyle(
                        color: colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )),
            ),
            ListView.builder(
              itemCount: 13,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colors.lightgrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 14.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                  numberController.getDataList[index + 36].name,
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Number : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                 "${ numberController.getDataList[index + 36].number}",
                                  // textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: colors.darkbrown, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
                    "અગત્યની માહિતી",
                    style: TextStyle(
                        color: colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )),
            ),
            ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: colors.lightgrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 14.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: colors.darkbrown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Flexible(
                                child: Text(
                                  numberController.getDataList[index + 49].name,
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
