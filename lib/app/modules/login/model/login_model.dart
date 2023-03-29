
import 'dart:convert';

UserLogin loginModelFromJson(String str) =>
    UserLogin.fromJson(json.decode(str));

class UserLogin {
  int? status;
  Data? loginData;

  UserLogin({this.status, this.loginData});

  UserLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    loginData = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (loginData != null) {
      data['data'] = loginData!.toJson();
    }
    return data;
  }
}

class Data {
  String? rId;
  String? name;
  String? middleName;
  String? lastName;
  String? birthdate;
  String? gender;
  String? address;
  String? emailed;
  String? mobileNo;
  String? business;
  String? username;
  String? password;
  String? vId;
  String? educationId;
  String? noOfMember;
  String? userProfile;
  String? homeId;
  String? activationId;
  String? createdDate;
  String? updatedDate;
  String? marriedId;
  String? age;
  String? bName;
  String? deviceType;
  String? deviceToken;
  String? vIdInt;
  String? industryId;
  String? busiType;

  Data(
      {this.rId,
        this.name,
        this.middleName,
        this.lastName,
        this.birthdate,
        this.gender,
        this.address,
        this.emailed,
        this.mobileNo,
        this.business,
        this.username,
        this.password,
        this.vId,
        this.educationId,
        this.noOfMember,
        this.userProfile,
        this.homeId,
        this.activationId,
        this.createdDate,
        this.updatedDate,
        this.marriedId,
        this.age,
        this.bName,
        this.deviceType,
        this.deviceToken,
        this.vIdInt,
        this.industryId,
        this.busiType});

  Data.fromJson(Map<String, dynamic> json) {
    rId = json['R_id'];
    name = json['Name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    birthdate = json['Birthdate'];
    gender = json['Gender'];
    address = json['Address'];
    emailed = json['Emailed'];
    mobileNo = json['Mobile_no'];
    business = json['Business'];
    username = json['Username'];
    password = json['Password'];
    vId = json['V_id'];
    educationId = json['Education_id'];
    noOfMember = json['No_of_member'];
    userProfile = json['User_profile'];
    homeId = json['Home_id'];
    activationId = json['Activation_id'];
    createdDate = json['Created_date'];
    updatedDate = json['Updated_date'];
    marriedId = json['married_id'];
    age = json['age'];
    bName = json['B_name'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    vIdInt = json['v_id_int'];
    industryId = json['industry_id'];
    busiType = json['busi_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['R_id'] = rId;
    data['Name'] = name;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['Birthdate'] = birthdate;
    data['Gender'] = gender;
    data['Address'] = address;
    data['Emailed'] = emailed;
    data['Mobile_no'] = mobileNo;
    data['Business'] = business;
    data['Username'] = username;
    data['Password'] = password;
    data['V_id'] = vId;
    data['Education_id'] = educationId;
    data['No_of_member'] = noOfMember;
    data['User_profile'] = userProfile;
    data['Home_id'] = homeId;
    data['Activation_id'] = activationId;
    data['Created_date'] = createdDate;
    data['Updated_date'] = updatedDate;
    data['married_id'] = marriedId;
    data['age'] = age;
    data['B_name'] = bName;
    data['device_type'] = deviceType;
    data['device_token'] = deviceToken;
    data['v_id_int'] = vIdInt;
    data['industry_id'] = industryId;
    data['busi_type'] = busiType;
    return data;
  }
}
