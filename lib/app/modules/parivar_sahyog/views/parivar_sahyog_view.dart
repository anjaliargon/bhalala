import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/Color.dart';
import '../../../constant/String_constant.dart';
import '../controllers/parivar_sahyog_controller.dart';
import '../model/sahyogmodel.dart';

class ParivarSahyogView extends GetView<ParivarSahyogController> {
  const ParivarSahyogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.darkbrown,
        title: Text(StringConstant.parivarsahyoug1),
      ),
      body: FutureBuilder<Parivarsahyog>(
          future: controller.sahyogdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
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
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: controller.SahyogData.value.data?.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: colors.darkbrown)),
                              child: Image.network(
                                "${controller.SahyogData.value.data?[index].picture}",
                                fit: BoxFit.fill,
                                errorBuilder: (a, b, c) => Image.asset(
                                    'assets/images/userprofile.png'),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${controller.SahyogData.value.data?[index].title}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: colors.darkbrown,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "${controller.SahyogData.value.data?[index].description}",
                            style: TextStyle(
                                color: colors.darkbrown,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
