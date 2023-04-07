import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

final box = GetStorage();

void main() async {
  await GetStorage.init();
  PermissionStatus storagestatus = await Permission.storage.request();
  if(storagestatus == PermissionStatus.granted){
    Fluttertoast.showToast(msg: 'Permission Granted');
  }if(storagestatus == PermissionStatus.denied){
    Fluttertoast.showToast(msg: 'you need to provide storage permission');
  }if(storagestatus == PermissionStatus.permanentlyDenied){
    openAppSettings();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff93281e), // status bar color
  ));
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }),
  );
}
