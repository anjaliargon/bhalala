import 'package:bhalala/app/modules/Editprofile/bindings/Editprofile_binding.dart';
import 'package:bhalala/app/modules/Editprofile/views/EditProfileScreen.dart';
import 'package:bhalala/app/modules/gamYadi/views/gamyadi_view.dart';
import 'package:bhalala/app/modules/login/views/login_view.dart';
import 'package:bhalala/app/modules/memberDetails/views/memberDetails_view.dart';
import 'package:bhalala/app/modules/noticeBoard/views/noticeBoard_view.dart';
import 'package:bhalala/app/modules/parivar_sahyog/parivarSahyogView.dart';
import 'package:bhalala/app/modules/profile/views/profile_view.dart';
import 'package:bhalala/app/modules/searchMember/views/search_view.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../data/Api/ApiProvider.dart';
import '../modules/About_family/About_familyscreen.dart';
import '../modules/FamilyCommitee/Familycommittee_Screen.dart';
import '../modules/Important_numbers/Important_numberScreen.dart';
import '../modules/Parivar_karyalay/parivar_karyalay.dart';
import '../modules/gamYadi/bindings/gamYadi_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/memberDetails/bindings/memberDetails_binding.dart';
import '../modules/noticeBoard/bindings/noticeBoard_binding.dart';
import '../modules/photoGallary/bindings/photoGallary_binding.dart';
import '../modules/photoGallary/views/photoGallary_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/searchMember/bindings/search_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      (!isNullEmptyOrFalse(box.read("userId"))) ? Routes.HOME : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding()),

    GetPage(
        name: _Paths.EditProfile,
        page: () => EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
      name: _Paths.ABOUT_FAMILY,
      page: () => AboutFamily_Details(),
    ),

    GetPage(
      name: _Paths.PARIVARKARAYALAY,
      page: () => const parivar_karyalay(),
    ),
    GetPage(
      name: _Paths.IMP_NUMBER,
      page: () => ImportantNumber_Screen(),
    ),
    GetPage(
      name: _Paths.SAHYOG,
      page: () => ParivarSahyogView(),
    ),
    GetPage(
        name: _Paths.VILLAGE,
        page: () => GamYadiView(),
        binding: GamYadiBinding()),
    GetPage(
        name: _Paths.SEARCH,
        page: () => SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: _Paths.PHOTO,
        page: () => PhotoGallaryView(),
        binding: PhotoGallaryBinding()),
    GetPage(
        name: _Paths.NOTICE,
        page: () => NoticeBoardView(),
        binding: NoticeBoardBinding()),
    GetPage(
        name: _Paths.MEMBER,
        page: () => MemberDetailsView(),
        binding: MemberDetailsBinding()),
    GetPage(
      name: _Paths.COMITEE,
      page: () => FamilyCommitte(),
    ),

    // GetPage(
    //   name: _Paths.APP_HELPLINE,
    //   page: () => const applicationhelpline(),
    // ),
    // GetPage(
    //   name: _Paths.NOTICE,
    //   page: () => NoticeBoardscreen(),
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
    //   name: _Paths.VILLAGE,
    //   page: () =>  villageScreen(),
    // ),

    //
    // GetPage(
    //     name: _Paths.PROFILE,
    //     page: () =>  Profilescreen(),
    //     binding: ProfileBinding()
    // ),
  ];
}
