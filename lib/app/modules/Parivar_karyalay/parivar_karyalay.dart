import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';

class parivar_karyalay extends StatelessWidget {
  const parivar_karyalay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.bhalalaparivar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(color: colors.lightgrey),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/applogo.png"),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                StringConstant.karyalay,
                style: TextStyle(color: colors.darkbrown, fontSize: 16.sp,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
               "સમસ્ત ${StringConstant.bhalalaparivar}",
                style: TextStyle(color: colors.darkbrown, fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "પટેલ ગોલ્ડ",
                style: TextStyle(color: colors.darkbrown, fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),SizedBox(
                height: 0.5.h,
              ),
              Text(
                "બી-113 ગોવિંદપાર્ક સોસાયટી",
                style: TextStyle(color: colors.darkbrown, fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),SizedBox(
                height: 0.5.h,
              ),
              Text(
                "સરથાણા - વ્રજ ચોકરોડ, સુરત",
                style: TextStyle(color: colors.darkbrown, fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),SizedBox(
                height: 0.5.h,
              ),
              Text(
                "ફોન.(0261)654971",
                style: TextStyle(color: colors.darkbrown, fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
