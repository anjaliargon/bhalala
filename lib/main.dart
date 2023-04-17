import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app/no_internet/provider_setup.dart';
import 'app/routes/app_pages.dart';

final box = GetStorage();

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff93281e), // status bar color
  ));
  runApp(
    MultiProvider(
      providers: providers,
      child: Sizer(builder: (context, orientation, deviceType) {
        return GlobalLoaderOverlay(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        );
      }),
    ),
  );
}
