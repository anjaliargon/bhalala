import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';
import 'Committecontroller.dart';

class FamilyCommitte extends StatelessWidget {
  FamilyCommitte({Key? key}) : super(key: key);
  final committecontroller = CommitteController();

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return GetBuilder(
        init: committecontroller,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: colors.darkbrown,
              title: Text(StringConstant.parivar_samiti),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 23.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: colors.lightgrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
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
                          Text(
                            StringConstant.ravajibhai,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: colors.darkbrown,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(StringConstant.main,
                              style: TextStyle(color: colors.darkbrown)),
                          Text(StringConstant.village_ravaji,
                              style: TextStyle(color: colors.darkbrown)),
                        ],
                      ),
                    ),
                    Container(
                      height: 23.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: colors.lightgrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
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
                          Text(
                            StringConstant.ravajibhai,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: colors.darkbrown,
                                fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: committecontroller.getCommitteDataList.length,
                  shrinkWrap: true,
                      itemBuilder: (context, index) {
                    return Column(
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
                                      committecontroller
                                          .getCommitteDataList[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                      committecontroller
                                          .getCommitteDataList[index]
                                          .member_work,
                                      style:
                                          TextStyle(color: colors.darkbrown,fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    committecontroller
                                        .getCommitteDataList[index].name,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: colors.darkbrown,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                      committecontroller
                                          .getCommitteDataList[index].mobile,
                                      style:
                                          TextStyle()),
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
                    );
                  },
                ))
              ],
            ),
          );
        });
  }
}
