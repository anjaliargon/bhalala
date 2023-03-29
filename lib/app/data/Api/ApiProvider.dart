import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../constant/String_constant.dart';
import '../../constant/shreprefrence.dart';
import '../../modules/login/model/login_model.dart';
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

        MySharedPreferences().setToken(loginModel.loginData?.rId.toString() ?? '');
        MySharedPreferences().setUserName(loginModel.loginData?.name.toString() ?? '');
        MySharedPreferences().setUserEmail(loginModel.loginData?.emailed.toString() ?? '');
        Fluttertoast.showToast(msg: StringConstant.suceesfullylogin);
      }
    } else {
      Fluttertoast.showToast(msg: "wrong credencial");
      print("error ${response1.reasonPhrase}");
    }
    return loginModel;
  }

  // Future<basicModel> getBasicData() async {
  //   basicModel Basicmodel = basicModel();
  //
  //   var request = http.MultipartRequest('GET',
  //       Uri.parse('http://bhalalaparivar.org/webservice/getallbasicdata.php'));
  //
  //   var response = await request.send();
  //   var response1 = await http.Response.fromStream(response);
  //   final result = jsonDecode(response1.body) as Map<String, dynamic>;
  //
  //   if (response1.statusCode == 200) {
  //     Basicmodel = basicModel.fromJson(result);
  //     print(Basicmodel.industrieslist);
  //     print("basic model${response1.body}");
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   return Basicmodel;
  // }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}