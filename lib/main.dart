import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app/no_internet/provider_setup.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
initFireBaseApp() async {
  await Firebase.initializeApp();
}
bool isFlutterLocalNotificationInitialize = false;
final box = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("1f4ce66d-4602-4966-9f9d-74a4a5cccc29");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  OneSignal.shared.setNotificationWillShowInForegroundHandler(
          (OSNotificationReceivedEvent event) {
        // Will be called whenever a notification is receiv ed in foreground
        // Display Notification, pass null param for not displaying the notification
        event.complete(event.notification);
      });
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
