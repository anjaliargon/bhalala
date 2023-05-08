import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as https;
import 'package:bhalala/app/constant/toast.dart';

class SendNotificationController extends GetxController {
  //TODO: Implement SendNotificationController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> discriptionController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

   sendNotification(String title, String message) async {
    try {
      var url = Uri.parse("https://onesignal.com/api/v1/notifications");
      var client = https.Client();

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic ODZkODYwYTUtODZhNS00Y2ExLThiOTAtMzZmZjIyOTM4NWRi',
      };

      var body = {
        "included_segments": [
          "Subscribed Users"
        ],
        "contents": {
          "en": message
        },
        "headings": {
          "en": title
        },
        "small_icon":"assets/images/applogo.png",
        "subtitle": {
          "en": "This is a subtitle, it should only appear on iOS devices"
        },
        "name": "BHALALA PARIVAR",
        "app_id": "1f4ce66d-4602-4966-9f9d-74a4a5cccc29"
      };

      var response =
      await client.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        showBottomLongToast("સૂચના મોકલાઈ ગઈ છે.");
      } else {
        showBottomLongToast("ફરીથી પ્રયાશ કરો.");
        print("");
      }
    } catch (e) {
      print(e);
    }
    return;
  }
  // sendNotification(title,discrtiption) async{
  //   final status = await OneSignal.shared.getDeviceState();
  //   OneSignal.shared.postNotification(OSCreateNotification(
  //     additionalData: {
  //       'data': 'this is our data',
  //     },
  //     heading: title.toString(),
  //     playerIds: ['25cf3196-1d5e-4f27-b61f-6395f1755e05'],
  //     content: discrtiption,
  //
  //   ));
  // }
}
