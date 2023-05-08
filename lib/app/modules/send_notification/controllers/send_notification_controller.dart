import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class SendNotificationController extends GetxController {
  //TODO: Implement SendNotificationController
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> discriptionController = TextEditingController().obs;
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
  // Future<List<String>> fetchUserIds() async {
  //   final app = await OneSignal.shared.getApplicationState();
  //   if (!app.inFocus) {
  //     await OneSignal.shared.setAppOpened();
  //   }
  //
  //   final status = await OneSignal.shared.getPermissionSubscriptionState();
  //   final userIds = [status.subscriptionStatus.userId];
  //
  //   return userIds;
  // }
  // Future<Response> sendNotification(List<String> tokenIdList, String contents, String heading) async{
  //   // final app = await OneSignal.shared.getApp();
  //   return await post(
  //     Uri.parse('https://onesignal.com/api/v1/notifications'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>
  //     {
  //       "app_id": "1f4ce66d-4602-4966-9f9d-74a4a5cccc29",//kAppId is the App Id that one get from the OneSignal When the application is registered.
  //
  //       "include_player_ids": tokenIdList,//tokenIdList Is the List of All the Token Id to to Whom notification must be sent.
  //
  //       // android_accent_color reprsent the color of the heading text in the notifiction
  //       "android_accent_color":"FF9976D2",
  //
  //       "small_icon":"ic_stat_onesignal_default",
  //
  //       "large_icon":"https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",
  //
  //       "headings": {"en": heading},
  //
  //       "contents": {"en": contents},
  //
  //
  //     }),
  //   );
  // }

  sendNotification(title,discrtiption) async{
    final status = await OneSignal.shared.getDeviceState();
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'this is our data',
      },
      heading: title.toString(),
      playerIds: ['25cf3196-1d5e-4f27-b61f-6395f1755e05'],
      content: discrtiption,
    ));
  }
}
