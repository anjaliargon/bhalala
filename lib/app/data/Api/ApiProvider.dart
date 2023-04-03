import 'dart:convert';

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
        box.write('mobileno', loginModel.loginData?.mobileNo);
        box.write('userId', loginModel.loginData?.rId);
        box.write('address', loginModel.loginData?.address);
        box.write('buissness', loginModel.loginData?.business);
        box.write('birthdate', loginModel.loginData?.birthdate);
        box.write('emailid', loginModel.loginData?.emailed);
        box.write('education', loginModel.loginData?.educationId);
        box.write('jati', loginModel.loginData?.gender);
        box.write('gam', loginModel.loginData?.vId);
        box.write('age', loginModel.loginData?.age);
        box.write('ghar', loginModel.loginData?.homeId);
        box.write('merragestatus', loginModel.loginData?.marriedId);
        box.write('bloodgroup', loginModel.loginData?.bName);
        box.write('membercount', loginModel.loginData?.noOfMember);
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

  Future<Profilemodel> Userprofile(userId) async {
    Profilemodel profilemodel = Profilemodel();
    String query = GlobalData.profileUrl;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': userId});

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

  Future<Notice> notice() async {
    Notice noticeModel = Notice();
    String query = GlobalData.noticeUrl;
    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      noticeModel = Notice.fromJson(result);
      print("basic model${response1.body}");
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
