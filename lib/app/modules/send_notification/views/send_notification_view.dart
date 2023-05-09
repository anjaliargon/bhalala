import 'package:bhalala/app/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../network/controller/network_controller.dart';
import '../controllers/send_notification_controller.dart';

class SendNotificationView extends GetView<SendNotificationController> {
  SendNotificationView({Key? key}) : super(key: key);
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    MyColor colors = MyColor();
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "સૂચના",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: colors.darkbrown,
            elevation: 0),
        body: GetBuilder<SendNotificationController>(
          init: SendNotificationController(),
          builder: (controller) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: controller.formKey.value,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: controller.titleController.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.darkbrown)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.darkbrown)),
                            labelText: 'Title',
                            labelStyle: TextStyle(color: colors.darkbrown),
                            hintText: 'Enter Title',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: controller.discriptionController.value,
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.darkbrown)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.darkbrown)),
                            labelText: 'વિગત લખો ',
                            labelStyle: TextStyle(
                              color: colors.darkbrown,
                            ),
                            hintText: 'Enter Details',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_networkController.connectionStatus.value == 1 ||
                              _networkController.connectionStatus.value == 2) {
                            if (controller.formKey.value.currentState!
                                .validate()) {
                              if (controller
                                  .titleController.value.text.isEmpty) {
                                Fluttertoast.showToast(msg: "type title");
                              } else if (controller
                                  .discriptionController.value.text.isEmpty) {
                                Fluttertoast.showToast(msg: "type Disctiption");
                              } else {
                                controller.sendNotification(
                                    controller.titleController.value.text,
                                    controller
                                        .discriptionController.value.text);
                                controller.titleController.value.clear();
                                controller.discriptionController.value.clear();
                              }
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    "કોઈ ઈન્ટરનેટ કનેકશન મળ્યું નથી.તમારું ઈન્ટરનેટ કનેકશન તપાસો અને ફરીથી પ્રયાસ કરો",
                                textColor: colors.black,
                                backgroundColor: colors.white);
                          }
                        },
                        child: Container(
                          height: 7.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: colors.darkbrown,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "મોકલો",
                            style: TextStyle(
                                color: colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
