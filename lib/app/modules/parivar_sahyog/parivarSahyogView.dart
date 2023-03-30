import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/Color.dart';
import '../../constant/String_constant.dart';

class ParivarSahyogView extends StatelessWidget {
  ParivarSahyogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.parivarsahyoug),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    height: 8.h,
                    width: 110.w,
                    child: Image.asset("assets/images/bg.png",fit: BoxFit.fill,)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "સ્નેહમિલન સમારોહ નાં ભોજન ખર્ચ દાતા ની યાદી અને તેમનો પરિચય",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            Text(
              "વર્ષ 2013: સમસ્ત ભાલાળા પરિવાર ભુવાગામ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog1,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/p19.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2014: શ્રી કાંતિભાઈ \nખીમજીભાઈ ઠાકરશીભાઈ (વેજાગામ)",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog2,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/p2.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2015: ભાલાળા પરિવાર\nભમરીયા , સ્વ.બાલુભાઈ વીરજીભાઈ \n(ભમરીયા) ",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog3,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/p18.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2016: શ્રી કનૈયાલાલ રવજીભાઈ \n(સીએ) નાના ઝીંઝુડા",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog4,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/ghanshyambhai_bhagat_2018.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2018: શ્રી ઘનશ્યામભાઈ\n સવજીભાઈ (ભગત) , શ્રી ભુપતભાઇ\n સવજીભાઈ , શ્રી સુરેશભાઈ \nસવજીભાઈ અમદાવાદ (પાંચટોબરા)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog5,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/p17.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2019: શ્રી ગોરધનભાઈ\n રાઘવભાઈ , શ્રી કાનજીભાઈ\n રાઘવભાઈ (બળેલ પીપરીયા)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog7,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: colors.darkbrown)),
                  child: Image.asset(
                    "assets/images/p9.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "વર્ષ 2020: શ્રી જયંતીભા\n ભગવાનભાઇ (કાકીડીમોલી)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.parivar_sahyog6,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1,
              color: colors.darkbrown,
            ),
          ],
        ),
      ),
    );
  }
}
