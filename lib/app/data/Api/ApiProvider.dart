import 'dart:convert';
import 'dart:io';
import 'package:bhalala/app/modules/FamilymemberDetails/Model/FamilyMemberModel.dart';
import 'package:bhalala/app/modules/memberDetails/Model/Deletemodel.dart';
import 'package:bhalala/app/modules/noticeBoard/model/noticeModel.dart';
import 'package:bhalala/app/modules/photoGallary/model/Gallaryalbum.dart';
import 'package:bhalala/app/modules/profile/model/profileModel.dart';
import 'package:bhalala/app/modules/searchMember/model/search_model.dart';
import 'package:bhalala/app/constant/toast.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../main.dart';
import '../../constant/sizeConstant.dart';
import '../../constant/String_constant.dart';
import '../../modules/Editprofile/model.dart';
import '../../modules/Family_add/model/familyAddmodel.dart';
import '../../modules/Family_add/model/verifyUserModel.dart';
import '../../modules/Family_samiti/samitiModel.dart';
import '../../modules/addmember/model/AddmemberModel.dart';
import '../../modules/login/model/ForgotModel.dart';
import '../../modules/login/model/login_model.dart';
import '../../modules/memberDetails/Model/MemberDetailsModel.dart';
import '../../modules/parivar_sahyog/model/sahyogmodel.dart';
import '../../modules/signUp/model/signUp_model.dart';
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
        box.write('profile_pic', loginModel.loginData?.userProfile);
        box.write('UserFirstname', loginModel.loginData?.name);
        box.write('Userlastname', loginModel.loginData?.lastName);
        box.write('Usermiddlename', loginModel.loginData?.middleName);
        box.write('userId', loginModel.loginData?.rId);
        box.write('emailid', loginModel.loginData?.emailed);
        box.write('age', loginModel.loginData?.age);
        box.write('address', loginModel.loginData?.address);
        box.write('v_id_int', loginModel.loginData?.vIdInt);
        box.write('v_id', loginModel.loginData?.vId);
        box.write('home_id', loginModel.loginData?.homeId);
        box.write('isAdmin', loginModel.loginData?.isAdmin);
        showBottomLongToast(StringConstant.suceesfullylogin);
      }
    } else {
      print("error ${response1.reasonPhrase}");
    }
    return loginModel;
  }

  Future<Profilemodel> Userprofile() async {
    Profilemodel profilemodel = Profilemodel();
    String query = GlobalData.profileUrl;
    final userid = box.read('userId');
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': userid.toString()});

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

  Future<deleteRecords> deleteData(ids) async {
    deleteRecords deletemodel = deleteRecords();
    String query = GlobalData.removememberUrl;
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_id': ids});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      deletemodel = deleteRecords.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return deletemodel;
  }

  Future<statusCheck> statuscheck() async {
    statusCheck accountSearchModel = statusCheck();
    String query = GlobalData.checkuserStatus;
    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      accountSearchModel = statusCheck.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return accountSearchModel;
  }

  Future<verifyUser> verifyUserfamily(ids, status) async {
    verifyUser check = verifyUser();
    String query = GlobalData.user_verify_decline;
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields
        .addAll({'user_id': ids.toString(), 'verify': status.toString()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      check = verifyUser.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return check;
  }

  Future<deleteRecords> deleteFamilyData(ids, mainids) async {
    deleteRecords deletemodel = deleteRecords();
    String query = GlobalData.removememberUrl;
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({
      'user_id': ids.toString(),
      'type': 'member',
      'user_id_main': mainids.toString()
    });

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      deletemodel = deleteRecords.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return deletemodel;
  }

  Future<ForgotPassword> forgot(forgotemail) async {
    ForgotPassword forgotmodel = ForgotPassword();
    String query = GlobalData.forgotPasswordUrl;
    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_email': forgotemail.toString()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      forgotmodel = ForgotPassword.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return forgotmodel;
  }

  Future<userRegistrationModel> userRegistration(
      user_name,
      mname,
      lname,
      gender,
      address,
      birthdate,
      user_email,
      password,
      mobile_no,
      industry_id,
      busi_type,
      business,
      no_of_member,
      education_id,
      b_name,
      v_name,
      v_id,
      home_id,
      married_id,
      profile_pic,
      // f_name,
      // f_fathername,
      // f_surname,
      // f_gender,
      // f_birthdate,
      // f_industrial,
      // f_busynesstype,
      // f_bussiness,
      // f_education,
      // f_blood,
      // f_status
      ) async {
    // final List<Map<String, String>> formDataList = [
    //   {
    //     "user_name": f_name.toString(),
    //     "lname": f_surname.toString(),
    //     "mname": f_fathername.toString(),
    //     "birthdate": f_birthdate.toString(),
    //     "gender": f_gender.toString(),
    //     "address":  address.toString(),
    //     "education_id": f_education.toString(),
    //     "age": "0",
    //     "mobile_no": mobile_no.toString(),
    //     "business": f_bussiness.toString(),
    //     "married_id": f_status.toString(),
    //     "home_id":home_id.toString(),
    //     "v_id": v_name.toString(),
    //     "b_name": f_blood.toString(),
    //     "v_id_int":v_id.toString(),
    //     "user_profile": "",
    //     "industry_id": f_industrial.toString(),
    //     "busi_type": f_busynesstype.toString()
    //   },
    // ];
    Map<String, dynamic> formDataMap = {
      "map": {
        // "user_name": f_name.toString(),
        // "lname": f_surname.toString(),
        // "mname": f_fathername.toString(),
        // "birthdate": f_birthdate.toString(),
        // "gender": f_gender.toString(),
        // "address":  address.toString(),
        // "education_id": f_education.toString(),
        // "age": "0",
        // "mobile_no": mobile_no.toString(),
        // "business": f_bussiness.toString(),
        // "married_id": f_status.toString(),
        // "home_id":home_id.toString(),
        // "v_id": v_name.toString(),
        // "b_name": f_blood.toString(),
        // "v_id_int":v_id.toString(),
        // "user_profile": "",
        // "industry_id": f_industrial.toString(),
        // "busi_type": f_busynesstype.toString()
      }
    };
    // String datePattern = "dd/MM/yyyy";
    // DateTime birthDate = DateFormat(datePattern).parse(birthdate);
    // DateTime today = DateTime.now();
    // int dayDiff = today.day - birthDate.day;
    FormData formData = FormData(formDataMap);
    userRegistrationModel userSignupmodel = userRegistrationModel();
    String query = GlobalData.signupUrl;
    var request = http.MultipartRequest('POST', Uri.parse(query));
    final bytes = File(profile_pic.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    DateTime currentDate = DateTime.now();
    var age = currentDate.year - birthdate.year;
    request.fields.addAll({
      'user_name': user_name.toString(),
      'birthdate': birthdate.toString(),
      'gender': gender.toString(),
      'address': address.toString(),
      'user_email': user_email.toString(),
      'mobile_no': mobile_no.toString(),
      'business': business.toString(),
      'password': password.toString(),
      'education_id': education_id.toString(),
      'age':"24",
      'married_id': married_id.toString(),
      'v_id': v_name.toString(),
      'b_name': b_name.toString(),
      'v_id_int': v_id.toString(),
      'device_type': 'A',
      'device_token':
          'dRZ4QD4_zTE:APA91bFQW-3STJf3AZFga9cg0u6OcXy9sU0qbAR_dyxYOjC_P68HyG-8-U1o8SnFYA-YJHFEz5QPF3N9rzgCJvwTaExXXSftCfgc-f5-0i6-LCEVQn7TL_igAkYXL4cTapyNnr33YSzs',
      'home_id': home_id.toString(),
      'no_of_member': no_of_member.toString(),
      // 'member_details': jsonEncode(formDataList),
      'member_details':
          ' [{"user_name":"${user_name.toString()}","lname":"${lname.toString()}","mname":"${mname.toString()}","birthdate":"${birthdate.toString()}","gender":"${gender.toString()}","address":"${address.toString()}","education_id":"${education_id.toString()}","age":"0","mobile_no":"${mobile_no.toString()}","business":"${business.toString()}","married_id":"${married_id.toString()}","user_email":""${user_email.toString()}"","home_id":"${home_id.toString()}","v_id":""${v_name.toString()}" ","b_name":""${b_name.toString()}"","v_id_int":""${v_id.toString()}"","user_profile":"","industry_id":""${industry_id.toString()}"","busi_type":""${busi_type.toString()}""}]',
      'mname': mname.toString(),
      'lname': lname.toString(),
      'industry_id': industry_id.toString(),
      'busi_type': busi_type.toString(),
      'user_profile':img64.toString(),
    });
    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);

    if (response.statusCode == 200) {
      userSignupmodel = userRegistrationModel.fromJson(result);
      print(response1.body);
    } else {
      print(response.reasonPhrase);
    }
    return userSignupmodel;
  }

  Future<Editmodel> editprofile(
    File?user_profile,
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
   if(user_profile != null){
     final bytes = File(user_profile.path).readAsBytesSync();
     String img64 = base64Encode(bytes);
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
       'user_profile':img64
       // 'user_profile':
       //     'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAAA3NCSVQICAjb4U/gAAAgAElEQVR4\\nnOy9y3IsubIltpYjkrvqnD7X+qqlgUwzmT5U36mhNJDaNNDt2/dUFZkBXxo4EIGIyEwmyWS+iGXb\\nuJPBSMDhcLwc/uD//j//Jmnw17///W+/vf4h4X/52y7n/J9tAKA0/POff/z16xfJ//vPv4Zh+Iu/\\ncs5ZDmC0BOCfpLv/t+G3f/u3f/u33/4B4P/8Y8w5v+5+//PPP33nJN0h6T9x99tvv/0XfwXwv/6u\\nlNJ/8Tcz+80piTQAw2509//k2O12f5ckJTCl9N/h4zj+dzDn/Ga/ADgGSX+88N///d///dc/3P3/\\n+Kfv9/s/f/v99fXV6QBe6Gb2wkRSSu7ugwf97i7uAEiUZGaSkpzkkEQyOST952Fw9999/Nd//dd/\\nvP01juP/9Nvv7s40vL29/Tm8/PHHH/827FJK/+/rm7vnlP744w+8vLj7CJnZbj/+4x//+Je3nHP+\\n3/7x97e3t//xb8ndk/ZmNjgAEAAAEYBoAF6zA9hTkvYkAAdI/lOS9Jpe/uM//uOv4TeS//WPP1NK\\nf0kAnCCZNAIgHMDIARWSJDmC23T3LAAgSTJeMLP9fv8//O13Sb+/7f/lX/7lt7wH8C9mAHYSSWr+\\nSsYbyWy7P/74Y7/bkfx//uNPM3ulSDogySEAiUZyl8e//e1vu4yc838aBpLKY0rJ6ZIMNLPdmCX9\\nzezl5eU3/ydJS7thGEa3t7e3VwfJ/7Z3Sa8pAXgl3f1Vyjn/X+MrABfdXaAkwKKNZuZ5D+C3YXB3\\nyn///fd/3f/x97///e9Okv+ZZmYYs5n9RXf3V2V3FwYAEiQpDVPP7oVxHN9oJP99/0byzTiO414w\\ns0zmnCELxgIAHQAJAOZ5t9ulLAB/3+0AMI+73W4IjhGSPGokJMEGSSOiB'
     });
   }else{
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
       // 'user_profile':img64
       // 'user_profile':
       //     'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAAA3NCSVQICAjb4U/gAAAgAElEQVR4\\nnOy9y3IsubIltpYjkrvqnD7X+qqlgUwzmT5U36mhNJDaNNDt2/dUFZkBXxo4EIGIyEwmyWS+iGXb\\nuJPBSMDhcLwc/uD//j//Jmnw17///W+/vf4h4X/52y7n/J9tAKA0/POff/z16xfJ//vPv4Zh+Iu/\\ncs5ZDmC0BOCfpLv/t+G3f/u3f/u33/4B4P/8Y8w5v+5+//PPP33nJN0h6T9x99tvv/0XfwXwv/6u\\nlNJ/8Tcz+80piTQAw2509//k2O12f5ckJTCl9N/h4zj+dzDn/Ga/ADgGSX+88N///d///dc/3P3/\\n+Kfv9/s/f/v99fXV6QBe6Gb2wkRSSu7ugwf97i7uAEiUZGaSkpzkkEQyOST952Fw9999/Nd//dd/\\nvP01juP/9Nvv7s40vL29/Tm8/PHHH/827FJK/+/rm7vnlP744w+8vLj7CJnZbj/+4x//+Je3nHP+\\n3/7x97e3t//xb8ndk/ZmNjgAEAAAEYBoAF6zA9hTkvYkAAdI/lOS9Jpe/uM//uOv4TeS//WPP1NK\\nf0kAnCCZNAIgHMDIARWSJDmC23T3LAAgSTJeMLP9fv8//O13Sb+/7f/lX/7lt7wH8C9mAHYSSWr+\\nSsYbyWy7P/74Y7/bkfx//uNPM3ulSDogySEAiUZyl8e//e1vu4yc838aBpLKY0rJ6ZIMNLPdmCX9\\nzezl5eU3/ydJS7thGEa3t7e3VwfJ/7Z3Sa8pAXgl3f1Vyjn/X+MrABfdXaAkwKKNZuZ5D+C3YXB3\\nyn///fd/3f/x97///e9Okv+ZZmYYs5n9RXf3V2V3FwYAEiQpDVPP7oVxHN9oJP99/0byzTiO414w\\ns0zmnCELxgIAHQAJAOZ5t9ulLAB/3+0AMI+73W4IjhGSPGokJMEGSSOiB'
     });
   }


    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);
    print(data);
    if (response.statusCode == 200) {
      editprofilemodel = Editmodel.fromJson(result);
      box.write('emailid', editprofilemodel.data?.first.emailed);
      box.write('UserFirstname', editprofilemodel.data?.first.name);
      box.write('Userlastname', editprofilemodel.data?.first.lastName);
      box.write('Usermiddlename', editprofilemodel.data?.first.middleName);
      box.write('profile_pic', editprofilemodel.data?.first.userProfile);
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

  Future<Parivarsamiti> familySamiti() async {
    Parivarsamiti samitiModel = Parivarsamiti();
    String query = GlobalData.parivarsamity;

    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      samitiModel = Parivarsamiti.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return samitiModel;
  }

  Future<Parivarsahyog> familyShyog() async {
    Parivarsahyog sahyogModel = Parivarsahyog();
    String query = GlobalData.parivarsahyog;

    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      sahyogModel = Parivarsahyog.fromJson(result);
      print(response1.body);
    } else {
      print(response.reasonPhrase);
    }
    return sahyogModel;
  }

  Future<Gallaryalbum> getAlbumData(selectedYear) async {
    Gallaryalbum gallaryphotomodel = Gallaryalbum();
    String query = GlobalData.AlbumData;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    request.fields.addAll({'user_name': selectedYear.toString()});

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      gallaryphotomodel = Gallaryalbum.fromJson(result);
    } else {
      print(response.reasonPhrase);
    }
    return gallaryphotomodel;
  }

  Future<Gallaryalbum> getAlbumData_year() async {
    Gallaryalbum gallaryphotomodel = Gallaryalbum();
    String query = GlobalData.AlbumDatayear;

    var request = http.MultipartRequest('GET', Uri.parse(query));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      gallaryphotomodel = Gallaryalbum.fromJson(result);
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
      print(response1.body);
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
      print(response1.body);
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
      String eeducation, String? blood) async {
    SearchModel searchmodel = SearchModel();
    String query = GlobalData.searchUrl;

    var request = http.MultipartRequest('POST', Uri.parse(query));
    if (isNullEmptyOrFalse(village) ||
        !isNullEmptyOrFalse(home) ||
        !isNullEmptyOrFalse(industri) ||
        !isNullEmptyOrFalse(blood) ||
        !isNullEmptyOrFalse(eeducation)) {
      request.fields.addAll({
        'home_name': home.toString(),
        'busi_id': industri.toString(),
        'edu_name': eeducation.toString(),
        'blood_name': blood.toString(),
        'busi_id': industri.toString(),
      });
    }

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

  Future<AddMember> addFamilyMember(
      user_name,
      mname,
      lname,
      gender,
      birthdate,
      b_name,
      married_id,
      industry_id,
      busi_type,
      business,
      education_id) async {
    AddMember addmember = AddMember();
    String query = GlobalData.addMember;
    var request = http.MultipartRequest('POST', Uri.parse(query));

    request.fields.addAll({
      'user_name': user_name.toString(),
      'birthdate': birthdate.toString(),
      'gender': gender.toString(),
      'address': box.read("address"),
      'user_email': box.read("emailid"),
      'mobile_no': box.read("mobileno"),
      'business': business.toString(),
      'education_id': education_id.toString(),
      'age': box.read('age'),
      'married_id': married_id.toString(),
      'v_id': box.read("v_id"),
      'B_name': b_name.toString(),
      'home_id': box.read("home_id"),
      'mname': mname.toString(),
      'lname': lname.toString(),
      'industry_id': industry_id.toString(),
      'busi_type': busi_type.toString(),
      'user_profile':
          'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAAA3NCSVQICAjb4U/gAAAgAElEQVR4\\nnOy9y3IsubIltpYjkrvqnD7X+qqlgUwzmT5U36mhNJDaNNDt2/dUFZkBXxo4EIGIyEwmyWS+iGXb\\nuJPBSMDhcLwc/uD//j//Jmnw17///W+/vf4h4X/52y7n/J9tAKA0/POff/z16xfJ//vPv4Zh+Iu/\\ncs5ZDmC0BOCfpLv/t+G3f/u3f/u33/4B4P/8Y8w5v+5+//PPP33nJN0h6T9x99tvv/0XfwXwv/6u\\nlNJ/8Tcz+80piTQAw2509//k2O12f5ckJTCl9N/h4zj+dzDn/Ga/ADgGSX+88N///d///dc/3P3/\\n+Kfv9/s/f/v99fXV6QBe6Gb2wkRSSu7ugwf97i7uAEiUZGaSkpzkkEQyOST952Fw9999/Nd//dd/\\nvP01juP/9Nvv7s40vL29/Tm8/PHHH/827FJK/+/rm7vnlP744w+8vLj7CJnZbj/+4x//+Je3nHP+\\n3/7x97e3t//xb8ndk/ZmNjgAEAAAEYBoAF6zA9hTkvYkAAdI/lOS9Jpe/uM//uOv4TeS//WPP1NK\\nf0kAnCCZNAIgHMDIARWSJDmC23T3LAAgSTJeMLP9fv8//O13Sb+/7f/lX/7lt7wH8C9mAHYSSWr+\\nSsYbyWy7P/74Y7/bkfx//uNPM3ulSDogySEAiUZyl8e//e1vu4yc838aBpLKY0rJ6ZIMNLPdmCX9\\nzezl5eU3/ydJS7thGEa3t7e3VwfJ/7Z3Sa8pAXgl3f1Vyjn/X+MrABfdXaAkwKKNZuZ5D+C3YXB3\\nyn///fd/3f/x97///e9Okv+ZZmYYs5n9RXf3V2V3FwYAEiQpDVPP7oVxHN9oJP99/0byzTiO414w\\ns0zmnCELxgIAHQAJAOZ5t9ulLAB/3+0AMI+73W4IjhGSPGokJMEGSSOiB',
      'user_id': box.read("userId"),
      'v_id_int': box.read("v_id_int")
    });
    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;
    Map<String, dynamic> data = jsonDecode(response1.body);

    if (response.statusCode == 200) {
      addmember = AddMember.fromJson(result);
      print(response1.body);
    } else {
      print(response.reasonPhrase);
    }
    return addmember;
  }
}
