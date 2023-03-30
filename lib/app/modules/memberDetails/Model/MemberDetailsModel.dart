class MemberDetails {
  int? status;
  List<MemberData>? data;

  MemberDetails({this.status, this.data});

  MemberDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MemberData>[];
      json['data'].forEach((v) {
        data!.add(new MemberData.fromJson(v));
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

class MemberData {
  String? rId;
  String? name;
  String? middleName;
  String? lastName;
  String? birthdate;
  String? gender;
  String? address;
  String? emailed;
  String? mobileNo;
  String? activationId;
  String? business;
  String? username;
  String? vId;
  String? educationId;
  String? noOfMember;
  String? userProfile;
  String? homeId;
  String? marriedId;
  String? createdDate;
  String? updatedDate;
  String? age;
  String? bName;
  String? deviceToken;

  MemberData(
      {this.rId,
        this.name,
        this.middleName,
        this.lastName,
        this.birthdate,
        this.gender,
        this.address,
        this.emailed,
        this.mobileNo,
        this.activationId,
        this.business,
        this.username,
        this.vId,
        this.educationId,
        this.noOfMember,
        this.userProfile,
        this.homeId,
        this.marriedId,
        this.createdDate,
        this.updatedDate,
        this.age,
        this.bName,
        this.deviceToken});

  MemberData.fromJson(Map<String, dynamic> json) {
    rId = json['R_id'];
    name = json['Name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    birthdate = json['Birthdate'];
    gender = json['Gender'];
    address = json['Address'];
    emailed = json['Emailed'];
    mobileNo = json['Mobile_no'];
    activationId = json['Activation_id'];
    business = json['Business'];
    username = json['Username'];
    vId = json['V_id'];
    educationId = json['Education_id'];
    noOfMember = json['No_of_member'];
    userProfile = json['User_profile'];
    homeId = json['Home_id'];
    marriedId = json['married_id'];
    createdDate = json['Created_date'];
    updatedDate = json['Updated_date'];
    age = json['age'];
    bName = json['B_name'];
    deviceToken = json['device_token'];
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
    data['Activation_id'] = this.activationId;
    data['Business'] = this.business;
    data['Username'] = this.username;
    data['V_id'] = this.vId;
    data['Education_id'] = this.educationId;
    data['No_of_member'] = this.noOfMember;
    data['User_profile'] = this.userProfile;
    data['Home_id'] = this.homeId;
    data['married_id'] = this.marriedId;
    data['Created_date'] = this.createdDate;
    data['Updated_date'] = this.updatedDate;
    data['age'] = this.age;
    data['B_name'] = this.bName;
    data['device_token'] = this.deviceToken;
    return data;
  }
}
