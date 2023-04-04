class FamilyMember {
  int? status;
  List<FamilyMemberData>? data;

  FamilyMember({this.status, this.data});

  FamilyMember.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FamilyMemberData>[];
      json['data'].forEach((v) {
        data!.add(FamilyMemberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FamilyMemberData {
  String? fId;
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
  String? vId;
  String? educationId;
  String? userProfile;
  String? homeId;
  String? marriedId;
  String? age;
  String? bName;

  FamilyMemberData(
      {this.fId,
        this.rId,
        this.name,
        this.middleName,
        this.lastName,
        this.birthdate,
        this.gender,
        this.address,
        this.emailed,
        this.mobileNo,
        this.business,
        this.vId,
        this.educationId,
        this.userProfile,
        this.homeId,
        this.marriedId,
        this.age,
        this.bName});

  FamilyMemberData.fromJson(Map<String, dynamic> json) {
    fId = json['F_id'];
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
    vId = json['V_id'];
    educationId = json['Education_id'];
    userProfile = json['User_profile'];
    homeId = json['Home_id'];
    marriedId = json['married_id'];
    age = json['age'];
    bName = json['B_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['F_id'] = this.fId;
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
    data['V_id'] = this.vId;
    data['Education_id'] = this.educationId;
    data['User_profile'] = this.userProfile;
    data['Home_id'] = this.homeId;
    data['married_id'] = this.marriedId;
    data['age'] = this.age;
    data['B_name'] = this.bName;
    return data;
  }
}
