import 'package:bhalala/app/constant/Color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../routes/app_pages.dart';
import '../../searchMember/controllers/search_controller.dart';
import '../controllers/searchmemberDetails_controller.dart';

class SearchMemberDetailsView extends GetView<SearchMemberDetailsController> {
  SearchMemberDetailsView({Key? key}) : super(key: key);
  final searchMemberController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringConstant.bhalalaparivar,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: colors.darkbrown,
          elevation: 0),
      body: Obx(
        () => ListView.builder(
          itemCount: searchMemberController.searchData.value.data?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: colors.green,
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        UrlLauncher.launch(
                            'tel:${searchMemberController.searchData.value.data?[index].mobileNo}');
                      },
                      backgroundColor: colors.white,
                      icon: Icons.call,
                      foregroundColor: colors.darkbrown,
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFFFE4A49),
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SearchMEMBERPROFILE,
                          arguments: {
                            ArgumentConstant.searchuserData : searchMemberController.searchData.value.data?[index]
                          });
                    },
                    child: Container(
                      // height: 120.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.lightgrey),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/userprofile.png"),
                              radius: 35,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${searchMemberController.searchData.value.data?[index].name} "
                                    "${searchMemberController.searchData.value.data?[index].middleName} "
                                    "${searchMemberController.searchData.value.data?[index].lastName}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: colors.darkbrown,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "${StringConstant.mobile} : ${searchMemberController.searchData.value.data?[index].mobileNo}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    "${StringConstant.address} : ${searchMemberController.searchData.value.data?[index].address}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    "${StringConstant.workdetails} : ${searchMemberController.searchData.value.data?[index].business}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
