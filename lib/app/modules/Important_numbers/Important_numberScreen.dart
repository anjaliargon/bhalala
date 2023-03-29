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
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.important_number),
      ),
      body:  Column(
        children: [
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
                itemCount: numberController.getDataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: colors.lightgrey,
                          borderRadius:
                          BorderRadius.all(Radius.circular(5))
                      ),
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
                                      color: colors.darkbrown, fontSize: 14.sp,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Number :",
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                                Flexible(
                                  child: Text(
                                    numberController.getDataList[index].number,
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
              ))
        ],
      ),
    );
  }
}

