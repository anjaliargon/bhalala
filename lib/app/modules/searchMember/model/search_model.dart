class SearchModel {
  int? status;
  List<searchData>? data;

  SearchModel({this.status, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <searchData>[];
      json['data'].forEach((v) {
        data!.add(new searchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class searchData {
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

  searchData(
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

  searchData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['R_id'] = this.rId;
    data['Name'] = this.name;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['Birthdate'] = this.birthdate;
    data['Gender'] = this.gender;
    data['Address'] = this.address;
    data['Emailed'] = this.emailed;
    data['Mobile_no'] = this.mobileNo;
    data['Business'] = this.business;
    data['Username'] = this.username;
    data['Password'] = this.password;
    data['V_id'] = this.vId;
    data['Education_id'] = this.educationId;
    data['No_of_member'] = this.noOfMember;
    data['User_profile'] = this.userProfile;
    data['Home_id'] = this.homeId;
    data['Activation_id'] = this.activationId;
    data['Created_date'] = this.createdDate;
    data['Updated_date'] = this.updatedDate;
    data['married_id'] = this.marriedId;
    data['age'] = this.age;
    data['B_name'] = this.bName;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['v_id_int'] = this.vIdInt;
    data['industry_id'] = this.industryId;
    data['busi_type'] = this.busiType;
    return data;
  }
}
