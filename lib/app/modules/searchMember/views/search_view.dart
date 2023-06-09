import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/String_constant.dart';
import '../../../network/controller/network_controller.dart';
import '../../../no_internet/check_network.dart';
import 'package:bhalala/app/modules/searchMember/controllers/search_controller.dart';

class SearchView extends GetView<searchController> {
  SearchView({Key? key}) : super(key: key);
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    String? industry;
    String? education;
    String? village;
    String? blood;
    String? home;
    final Controller = Get.put(searchController());
    MyColor colors = MyColor();
    return GetBuilder<searchController>(
      init: Controller,
      builder: (controller) => CheckNetwork(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colors.darkbrown,
            elevation: 0,
            centerTitle: true,
            title: Text(
              StringConstant.search_member,
              style: TextStyle(color: colors.white, fontSize: 20.sp),
            ),
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.sp,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.darkbrown),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Icon(
                            Icons.location_on,
                            color: colors.darkbrown,
                            size: 22.sp,
                          )),
                          Expanded(
                            flex: 6,
                            child: DropdownButton(
                              hint: Text(StringConstant.search_village,
                                  style: TextStyle(
                                      color: colors.black,
                                      fontWeight: FontWeight.w500)),
                              isExpanded: true,
                              elevation: 0,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                village = newvalue!;
                                controller.villageController.text = newvalue;
                                controller.update();
                              },
                              value: village,
                              items: controller.accountVillageListData
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items.vName,
                                  child: Text(
                                    items.vName!,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.darkbrown),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Icon(
                            Icons.home,
                            color: colors.darkbrown,
                            size: 22.sp,
                          )),
                          Expanded(
                            flex: 6,
                            child: DropdownButton(
                              hint: Text(StringConstant.search_home,
                                  style: TextStyle(
                                      color: colors.black,
                                      fontWeight: FontWeight.w500)),
                              isExpanded: true,
                              elevation: 0,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                home = newvalue!;
                                controller.homeController.text = newvalue;
                                controller.update();
                              },
                              value: home,
                              items: controller.accountHomeListData
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.darkbrown),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: FaIcon(
                                FontAwesomeIcons.graduationCap,
                                color: colors.darkbrown,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: DropdownButton(
                              hint: Text(StringConstant.work_sectorchoice,
                                  style: TextStyle(
                                      color: colors.black,
                                      fontWeight: FontWeight.w500)),
                              isExpanded: true,
                              elevation: 0,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                industry = newvalue!;
                                controller.industryController.text = newvalue;
                                controller.update();
                              },
                              value: industry,
                              items: controller.accountIndustryListData
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items.name,
                                  child: Text(
                                    items.name.toString(),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.darkbrown),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: FaIcon(
                                FontAwesomeIcons.graduationCap,
                                color: colors.darkbrown,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: DropdownButton(
                              hint: Text(StringConstant.search_education,
                                  style: TextStyle(
                                      color: colors.black,
                                      fontWeight: FontWeight.w500)),
                              isExpanded: true,
                              elevation: 0,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                education = newvalue!;
                                controller.educationController.text = newvalue;
                                controller.update();
                              },
                              value: education,
                              items: controller.accountEducationListData
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.darkbrown),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: FaIcon(
                                FontAwesomeIcons.person,
                                color: colors.darkbrown,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: DropdownButton(
                              hint: Text(StringConstant.blood_chooes,
                                  style: TextStyle(
                                      color: colors.black,
                                      fontWeight: FontWeight.w500)),
                              isExpanded: true,
                              elevation: 0,
                              underline: Container(
                                color: colors.white,
                              ),
                              onChanged: (String? newvalue) {
                                blood = newvalue!;
                                controller.bloodController.text = newvalue;
                                controller.update();
                              },
                              value: blood,
                              items: controller.accountBloodListData
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colors.darkbrown)),
                      onPressed: () async {
                        if (_networkController.connectionStatus.value == 1 ||
                            _networkController.connectionStatus.value == 2) {
                          controller.search(
                              // controller.villageController.value.text,
                              // controller.homeController.value.text,
                              // controller.industryController.value.text,
                              // controller.educationController.value.text,
                              // controller.bloodController.value.text,
                              );

                          if (controller.isLoading.value) {
                            context.loaderOverlay.hide();
                          }
                        }
                      },
                      child: const Text("શોધો"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
