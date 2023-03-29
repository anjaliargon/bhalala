import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../../constant/String_constant.dart';
import '../../constant/shreprefrence.dart';
import '../../modules/login/model/login_model.dart';
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
        box.write('mobileno', loginModel.loginData?.mobileNo);
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
        print(box.read('Data'));
        MySharedPreferences()
            .setUserId(loginModel.loginData?.rId.toString() ?? '');
        MySharedPreferences()
            .setUserName(loginModel.loginData?.name.toString() ?? '');
        MySharedPreferences()
            .setUserEmail(loginModel.loginData?.emailed.toString() ?? '');
        MySharedPreferences()
            .setUserLastname(loginModel.loginData?.lastName.toString() ?? '');
        Fluttertoast.showToast(msg: StringConstant.suceesfullylogin);
      }
    } else {
      Fluttertoast.showToast(msg: "wrong credencial");
      print("error ${response1.reasonPhrase}");
    }
    return loginModel;
  }
  Future<BasicModel> getBasicData() async {
    BasicModel basicmodel = BasicModel();

    var request = http.MultipartRequest('GET',
        Uri.parse('http://bhalalaparivar.org/webservice/getallbasicdata.php'));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      basicmodel = BasicModel.fromJson(result);
      print(basicmodel.industrieslist);
      print("basic model${response1.body}");
    } else {
      print(response.reasonPhrase);
    }
    return basicmodel;
  }


  Future<MemberCount> memberCount() async {
    MemberCount memberModel = MemberCount();

    var request = http.MultipartRequest('GET',
        Uri.parse('https://bhalalaparivar.org/webservice/getmembercount.php'));

    var response = await request.send();
    var response1 = await http.Response.fromStream(response);
    final result = jsonDecode(response1.body) as Map<String, dynamic>;

    if (response1.statusCode == 200) {
      memberModel = MemberCount.fromJson(result);
      print("basic model${response1.body}");
    } else {
      print(response.reasonPhrase);
    }
    return memberModel;
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
