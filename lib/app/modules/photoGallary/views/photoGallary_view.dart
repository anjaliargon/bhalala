import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/String_constant.dart';
import '../../../no_internet/check_network.dart';
import '../controllers/photoGallary_controller.dart';
import 'package:bhalala/app/modules/photoGallary/views/photoViewimage.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? year;
    String? function;
    bool isyearSelected = false;
    bool isfunctionSelected = false;
    final loginController = Get.put(PhotoGallaryController());
    MyColor colors = MyColor();
    return GetBuilder<PhotoGallaryController>(
      init: loginController,
      builder: (controller) => CheckNetwork(
        child: Scaffold(
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
                                onChanged: (String? newvalue) async {
                                year = newvalue!;

                                controller.yearController.text = newvalue;
                                controller.functionController.clear();
                                await controller.getFunctionData(date: newvalue);
                                isyearSelected = true;
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
                                  controller.getImageData(date: newvalue);
                                },
                                value: (controller.functionController.text.isEmpty)?null:controller.functionController.text,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()
                          ),
                          gridDelegate:
                           const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemCount: controller.imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(0.5),
                              child: InkWell(
                                onTap: (){
                                  Get.to(PhotoViewPage(index:index,photos: controller.imageList,));
                                },
                                child: PhotoViewGallery.builder(
                                  itemCount: controller.imageList.length,
                                  builder: (BuildContext context, int index) => PhotoViewGalleryPageOptions.customChild(
                                    child:  CachedNetworkImage(
                                      imageUrl:controller.imageList[index].imageUrl.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context,url)=>Container(color:Colors.white,child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: CircularProgressIndicator(color: colors.darkbrown,backgroundColor: Colors.transparent),
                                      )),
                                      errorWidget: (context,url,error)=>Image.asset("assets/images/applogo.png")
                                    ),
                                  ),
                                  enableRotation: true,
                                  pageController: PageController(initialPage: index),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
