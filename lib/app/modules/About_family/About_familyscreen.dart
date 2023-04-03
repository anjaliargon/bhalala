import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';

class AboutFamily_Details extends StatelessWidget {
  const AboutFamily_Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.bhalalaparivar),
      ),
      body: Stack(
        children: [
          Container(
              height: 305.h,
              child: Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.fill,
              )),
          ListView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        StringConstant.firstline_aboutfamily,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        StringConstant.secondline_aboutfamily,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        StringConstant.first_paregraph,
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                      Text(
                        StringConstant.second_paregraph,
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        StringConstant.thirdline_aboutfamily,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        StringConstant.third_paragraph,
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        StringConstant.fourth_paragraph,
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        StringConstant.About_family,
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_kuldevimandir,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/moviya_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/moviya_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_nanaliliya,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/nana_liliya_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/nana_liliya_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_bhuva,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/bhuvagam_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/bhuvagam_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_motaliliya,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/mota_liliya_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/mota_liliya_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_shivgadh,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/shivrajgadh_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/shivrajgadh_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_ghuharavala,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                          height: 20.h,
                          width: 50.h,
                          child: Image.asset(
                            "assets/images/hanumandada_ghughrala.png",
                            fit: BoxFit.fill,
                          )),
                      SizedBox(height: 2.h),
                      Center(
                        child: Text(
                          StringConstant.bhalala_sarpura,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/thavi_one.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                              height: 16.h,
                              width: 20.h,
                              child: Image.asset(
                                "assets/images/thavi_two.png",
                                fit: BoxFit.fill,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: 21.h,
                width: 100.w,
                child: Image.asset(
                  "assets/images/bg.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  alignment: Alignment.center,
                  height: 15.h,
                  child: Image.asset(
                    "assets/images/applogo.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
