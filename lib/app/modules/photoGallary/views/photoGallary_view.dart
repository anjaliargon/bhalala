import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../controllers/photoGallary_controller.dart';

class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? year;
    String? function;
    final loginController = Get.put(PhotoGallaryController());
    MyColor colors = MyColor();
    return GetBuilder<PhotoGallaryController>(
      init: loginController,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: colors.darkbrown,
          elevation: 0,
          centerTitle: true,
          title: Text(
            StringConstant.bhalalaparivar,
            style: TextStyle(color: colors.white, fontSize: 20.sp),
          ),
        ),
        body: Obx(
             () => Stack(
            children: [
              Container(
                  height: 100.h,
                  child: Image.asset(
                    "assets/images/bg.png",
                    fit: BoxFit.fill,
                  )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: colors.white,
                          border: Border.all(color: colors.darkbrown),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            hint: Text(
                              "વર્ષ પસંદ કરો",
                              style: TextStyle(color: colors.black),
                            ),
                            isExpanded: true,
                            underline: Container(
                              color: colors.white,
                            ),
                            onChanged: (String? newvalue) {
                              year = newvalue!;
                              // year != null ? year = null : null;
                              controller.yearController.text = newvalue;
                              controller.update();
                            },
                            value: year,
                            items: controller.yearListData
                                .toSet()
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: colors.white,
                            border: Border.all(color: colors.darkbrown),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              hint: Text(
                                "આલ્બમ નું નામ પસંદ કરો ",
                                style: TextStyle(color: colors.black),
                              ),
                              isExpanded: true,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                function = newvalue!;
                                controller.functionController.text = newvalue;
                                controller.update();
                              },
                              value: function,
                              items: controller.functionListData
                                  .toSet()
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                          ))),
                  (function != null) ?
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              crossAxisCount: 2),
                          itemCount: controller.gallaryphotos.value.data?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child:  Image.network(
                                "${controller.gallaryphotos.value.data?[index].imageUrl}",
                                fit: BoxFit.cover,
                                errorBuilder: (a, b, c) =>
                                    Image.asset('assets/images/applogo.png'),
                              ),
                            );
                          },
                        ),
                      ),
                    ) :
                    Container(),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
