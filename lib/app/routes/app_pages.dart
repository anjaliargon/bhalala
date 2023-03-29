import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.SPLACE,
    //   page: () => SplashScreen(),
    // ),
    // GetPage(
    //   name: _Paths.APP_HELPLINE,
    //   page: () => const applicationhelpline(),
    // ),
    // GetPage(
    //   name: _Paths.NOTICE,
    //   page: () => NoticeBoardscreen(),
    // ),
    // GetPage(
    //   name: _Paths.LOGIN,
    //   page: () => Loginscreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNUP,
    //   page: () => SignUpscreen(),
    //   binding: SignUpBinding(),
    // ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => Homescreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.IMP_NUMBER,
    //   page: () =>  ImportantNumber_Screen(),
    // ),
    // GetPage(
    //   name: _Paths.PARIVARKARAYALAY,
    //   page: () => const parivar_karyalay(),
    // ),
    // GetPage(
    //   name: _Paths.VILLAGE,
    //   page: () =>  villageScreen(),
    // ),
    // GetPage(
    //   name: _Paths.ABOUT_FAMILY,
    //   page: () =>  AboutFamily_Details(),
    // ),
    // GetPage(
    //   name: _Paths.COMITEE,
    //   page: () =>  FamilyCommitte(),
    // ),
    //
    // GetPage(
    //     name: _Paths.PROFILE,
    //     page: () =>  Profilescreen(),
    //     binding: ProfileBinding()
    // ),
  ];
}
