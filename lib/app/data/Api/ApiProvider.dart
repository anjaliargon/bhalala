import 'dart:convert';

import 'package:bhalala/app/modules/FamilymemberDetails/Model/FamilyMemberModel.dart';
import 'package:bhalala/app/modules/noticeBoard/model/noticeModel.dart';
import 'package:bhalala/app/modules/searchMember/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../constant/String_constant.dart';
import '../../constant/sizeConstant.dart';
import '../../modules/login/model/login_model.dart';
import '../../modules/memberDetails/Model/MemberDetailsModel.dart';
import '../../modules/photoGallary/model/photoGallary_model.dart';
import '../../modules/profile/model/profileModel.dart';
import '../Model/MemberCount.dart';
import '../Model/basicModel.dart';
import 'ApiUrl.dart';

class ApiProvider {
  static var client = http.Client();

  Future<UserLogin> login(String email, String password) async {
    UserLogin loginModel = UserLogin();
    String query = GlobalData.loginUrl;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'email': email.trim(), 'password': password.trim()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);

    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      if (!isNullEmptyOrFalse(data['data'])) {
        loginModel = UserLogin.fromJson(data);
        box.write('login', true);
        box.write('mobileno', loginModel.loginData?.mobileNo);
        box.write('UserFirstname', loginModel.loginData?.name);
        box.write('Userlastname', loginModel.loginData?.lastName);
        box.write('Usermiddlename', loginModel.loginData?.middleName);
        box.write('userId', loginModel.loginData?.rId);
        box.write('emailid', loginModel.loginData?.emailed);
        Fluttertoast.showToast(
            msg: StringConstant.suceesfullylogin,
            backgroundColor: Colors.white,
            fontSize: 14.sp,
            textColor: Colors.black);
      }
    } else {
      print("error ${response1.reasonPhrase}");
    }
    return loginModel;
  }

  Future<Profilemodel> Userprofile() async {
    Profilemodel profilemodel = Profilemodel();
    String query = GlobalData.profileUrl;
    final username = box.read('userId');
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': username.toString()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      profilemodel = Profilemodel.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return profilemodel;
  }

  Future<BasicModel> getBasicData() async {
    BasicModel basicmodel = BasicModel();
    String query = GlobalData.basicdataUrl;

    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      basicmodel = BasicModel.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return basicmodel;
  }
  Future<Gallary> getAlbumData() async {
    Gallary  gallaryphotomodel = Gallary();
    String query = GlobalData.AlbumData;

    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      gallaryphotomodel = Gallary.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return gallaryphotomodel;
  }

  Future<MemberCount> memberCount() async {
    MemberCount memberModel = MemberCount();
    String query = GlobalData.membercountUrl;
    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      memberModel = MemberCount.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return memberModel;
  }

  Future<MemberDetails> memberDetailsCount(villageId) async {
    MemberDetails memberdetailsModel = MemberDetails();
    String query = GlobalData.memberdetailsUrl;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': villageId});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      if ((data['status']) == 1) {
        memberdetailsModel = MemberDetails.fromJson(result);

      }
    } else {
      print(response.reasonPhrase);
    }
    return memberdetailsModel;
  }
  Future<FamilyMember> FamilymemberDetails(memberId) async {
    FamilyMember familymemberModel = FamilyMember();
    String query = GlobalData.Familymember;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': memberId});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      if ((data['status']) == 1) {
        familymemberModel = FamilyMember.fromJson(result);

      }
    } else {
      print(response.reasonPhrase);
    }
    return familymemberModel;
  }

  Future<Notice> notice() async {
    Notice noticeModel = Notice();
    String query = GlobalData.noticeUrl;
    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      noticeModel = Notice.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return noticeModel;
  }

  Future<SearchModel> search(String village, String home, String industri,
      String eeducation, String blood) async {
    SearchModel searchmodel = SearchModel();
    String query = GlobalData.searchUrl;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({
      'village_id': village.toString(),
      'home_name': home.toString(),
      'edu_name': eeducation.toString(),
      'blood_name': blood.toString(),
      'busi_id': industri.toString()
    });

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);

    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      if (data['status'] == 1) {
        searchmodel = SearchModel.fromJson(data);
      }
    } else {
      print("error ${response1.reasonPhrase}");
    }
    return searchmodel;
  }
}
