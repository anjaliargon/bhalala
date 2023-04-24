import 'package:get/get.dart';

import '../modules/About_family/About_familyscreen.dart';
import '../modules/Editprofile/bindings/Editprofile_binding.dart';
import '../modules/Editprofile/views/EditProfileScreen.dart';
import '../modules/FamilyMemberprofile/views/FamilyMemberprofile_view.dart';
import '../modules/Family_add/bindings/family_add_binding.dart';
import '../modules/Family_add/views/family_add_view.dart';
import '../modules/Family_samiti/bindings/family_samiti_binding.dart';
import '../modules/Family_samiti/views/family_samiti_view.dart';
import '../modules/FamilymemberDetails/bindings/Familymember_binding.dart';
import '../modules/FamilymemberDetails/views/FamilymemberDetails_view.dart';
import '../modules/Important_numbers/Important_numberScreen.dart';
import '../modules/Memberprofile/bindings/Memberprofile_binding.dart';
import '../modules/Memberprofile/views/Memberprofile_view.dart';
import '../modules/Parivar_karyalay/parivar_karyalay.dart';
import '../modules/addmember/bindings/addmember_binding.dart';
import '../modules/addmember/views/addmember_view.dart';
import '../modules/gamYadi/bindings/gamYadi_binding.dart';
import '../modules/gamYadi/views/gamyadi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/memberDetails/bindings/memberDetails_binding.dart';
import '../modules/memberDetails/views/memberDetails_view.dart';
import '../modules/noticeBoard/bindings/noticeBoard_binding.dart';
import '../modules/noticeBoard/views/Details_noticeboard.dart';
import '../modules/noticeBoard/views/noticeBoard_view.dart';
import '../modules/parivar_sahyog/bindings/parivar_sahyog_binding.dart';
import '../modules/parivar_sahyog/views/parivar_sahyog_view.dart';
import '../modules/photoGallary/bindings/photoGallary_binding.dart';
import '../modules/photoGallary/views/photoGallary_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/searchMember/bindings/search_binding.dart';
import '../modules/searchMember/views/search_view.dart';
import '../modules/searchMemberprofile/bindings/searchMemberprofile_binding.dart';
import '../modules/searchMemberprofile/views/searchMemberprofile_view.dart';
import '../modules/searchmemberDetails/bindings/searchmemberDetails_binding.dart';
import '../modules/searchmemberDetails/views/searchmemberDetails_view.dart';
import '../modules/signUp/bindings/signUp_binding.dart';
import '../modules/signUp/views/signUp_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verifyUserProfile/bindings/verify_user_profile_binding.dart';
import '../modules/verifyUserProfile/views/verify_user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.MEMBERPROFILE,
        page: () => MemberProfileView(),
        binding: MemberProfileBinding()),
    GetPage(
        name: _Paths.FAMILYMEMBER,
        page: () => FamilyMemberView(),
        binding: FamilyMemberBinding()),
    GetPage(
        name: _Paths.FAMILYMEMBERPROFILE,
        page: () => FamilyMemberProfileView(),
        binding: FamilyMemberBinding()),
    GetPage(
        name: _Paths.SearchMEMBERPROFILE,
        page: () => SearchProfileView(),
        binding: SearchProfileBinding()),
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
    // GetPage(
    //   name: _Paths.SAHYOG,
    //   page: () => ParivarSahyogView(),
    // ),
    GetPage(
        name: _Paths.VILLAGE,
        page: () => GamYadiView(),
        binding: GamYadiBinding()),
    GetPage(
        name: _Paths.SEARCH,
        page: () => SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: _Paths.SEARCHMEMBER,
        page: () => SearchMemberDetailsView(),
        binding: SearchMemberDetailsBinding()),
    GetPage(
        name: _Paths.PHOTO,
        page: () => PhotoGallaryView(),
        binding: PhotoGallaryBinding()),
    GetPage(
        name: _Paths.NOTICE,
        page: () => NoticeBoardView(),
        binding: NoticeBoardBinding()),
    GetPage(
      name: _Paths.NOTICEBOARD,
      page: () => NoticeBoardDetailsView(),
    ),
    GetPage(
        name: _Paths.MEMBER,
        page: () => MemberDetailsView(),
        binding: MemberDetailsBinding()),
    GetPage(
      name: _Paths.ADDMEMBER,
      page: () => AddmemberView(),
      binding: AddmemberBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_ADD,
      page: () => FamilyAddView(),
      binding: FamilyAddBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_SAMITI,
      page: () => const FamilySamitiView(),
      binding: FamilySamitiBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_USER_PROFILE,
      page: () => VerifyUserProfileView(),
      binding: VerifyUserProfileBinding(),
    ),
    GetPage(
      name: _Paths.PARIVAR_SAHYOG,
      page: () => const ParivarSahyogView(),
      binding: ParivarSahyogBinding(),
    ),
  ];
}
