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
import '../../modules/Editprofile/model.dart';
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
        box.write('age', loginModel.loginData?.age);
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

  Future<MemberDetails> Userprofile() async {
    MemberDetails profilemodel = MemberDetails();
    String query = GlobalData.profileUrl;
    final username = box.read('userId');
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': username.toString()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      profilemodel = MemberDetails.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return profilemodel;
  }

  Future<Editmodel> editprofile(
    user_name,
    mname,
    lname,
    birthdate,
    gender,
    address,
    user_email,
    mobile,
    inductries,
    work,
    work_details,
    education_id,
    blood,
    village,
    curent_city,
    status,
  ) async {
    Editmodel editprofilemodel = Editmodel();
    String query = GlobalData.editprofileUrl;
    var request = http.MultipartRequest('POST', Uri.parse(query));

    request.fields.addAll({
      'user_name': user_name.toString(),
      'mname': mname.toString(),
      'lname': lname.toString(),
      'birthdate': birthdate.toString(),
      'gender': gender.toString(),
      'address': address.toString(),
      'user_email': user_email.toString(),
      'mobile_no': mobile.toString(),
      'industry_id': inductries.toString(),
      'busi_type': work.toString(),
      'business': work_details.toString(),
      'education_id': education_id.toString(),
      'b_name': blood.toString(),
      'v_id': village.toString(),
      'home_id': curent_city.toString(),
      'married_id': status.toString(),
      'age': box.read('age'),
      'user_id': box.read('userId'),
      'user_profile':
          'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAAA3NCSVQICAjb4U/gAAAgAElEQVR4\\nnOy9y3IsubIltpYjkrvqnD7X+qqlgUwzmT5U36mhNJDaNNDt2/dUFZkBXxo4EIGIyEwmyWS+iGXb\\nuJPBSMDhcLwc/uD//j//Jmnw17///W+/vf4h4X/52y7n/J9tAKA0/POff/z16xfJ//vPv4Zh+Iu/\\ncs5ZDmC0BOCfpLv/t+G3f/u3f/u33/4B4P/8Y8w5v+5+//PPP33nJN0h6T9x99tvv/0XfwXwv/6u\\nlNJ/8Tcz+80piTQAw2509//k2O12f5ckJTCl9N/h4zj+dzDn/Ga/ADgGSX+88N///d///dc/3P3/\\n+Kfv9/s/f/v99fXV6QBe6Gb2wkRSSu7ugwf97i7uAEiUZGaSkpzkkEQyOST952Fw9999/Nd//dd/\\nvP01juP/9Nvv7s40vL29/Tm8/PHHH/827FJK/+/rm7vnlP744w+8vLj7CJnZbj/+4x//+Je3nHP+\\n3/7x97e3t//xb8ndk/ZmNjgAEAAAEYBoAF6zA9hTkvYkAAdI/lOS9Jpe/uM//uOv4TeS//WPP1NK\\nf0kAnCCZNAIgHMDIARWSJDmC23T3LAAgSTJeMLP9fv8//O13Sb+/7f/lX/7lt7wH8C9mAHYSSWr+\\nSsYbyWy7P/74Y7/bkfx//uNPM3ulSDogySEAiUZyl8e//e1vu4yc838aBpLKY0rJ6ZIMNLPdmCX9\\nzezl5eU3/ydJS7thGEa3t7e3VwfJ/7Z3Sa8pAXgl3f1Vyjn/X+MrABfdXaAkwKKNZuZ5D+C3YXB3\\nyn///fd/3f/x97///e9Okv+ZZmYYs5n9RXf3V2V3FwYAEiQpDVPP7oVxHN9oJP99/0byzTiO414w\\ns0zmnCELxgIAHQAJAOZ5t9ulLAB/3+0AMI+73W4IjhGSPGokJMEGSSOiB'
    });

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);

    if (response.statusCode == 200) {
      editprofilemodel = Editmodel.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return editprofilemodel;
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
    Gallary gallaryphotomodel = Gallary();
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
