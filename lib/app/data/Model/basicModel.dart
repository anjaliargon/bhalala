class BasicModel {
  int? status;
  List<Education>? education;
  List<VillageBasic>? village;
  List<Married>? married;
  List<Home>? home;
  List<BloodGroup>? bloodGroup;
  List<IndustrieslistBasic>? industrieslist;

  BasicModel(
      {this.status,
        this.education,
        this.village,
        this.married,
        this.home,
        this.bloodGroup,
        this.industrieslist});

  BasicModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Education'] != null) {
      education = <Education>[];
      json['Education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    if (json['Village'] != null) {
      village = <VillageBasic>[];
      json['Village'].forEach((v) {
        village!.add(VillageBasic.fromJson(v));
      });
    }
    if (json['Married'] != null) {
      married = <Married>[];
      json['Married'].forEach((v) {
        married!.add(Married.fromJson(v));
      });
    }
    if (json['Home'] != null) {
      home = <Home>[];
      json['Home'].forEach((v) {
        home!.add(Home.fromJson(v));
      });
    }
    if (json['Blood_Group'] != null) {
      bloodGroup = <BloodGroup>[];
      json['Blood_Group'].forEach((v) {
        bloodGroup!.add(BloodGroup.fromJson(v));
      });
    }
    if (json['Industrieslist'] != null) {
      industrieslist = <IndustrieslistBasic>[];
      json['Industrieslist'].forEach((v) {
        industrieslist!.add(IndustrieslistBasic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (education != null) {
      data['Education'] = education!.map((v) => v.toJson()).toList();
    }
    if (village != null) {
      data['Village'] = village!.map((v) => v.toJson()).toList();
    }
    if (married != null) {
      data['Married'] = married!.map((v) => v.toJson()).toList();
    }
    if (home != null) {
      data['Home'] = home!.map((v) => v.toJson()).toList();
    }
    if (bloodGroup != null) {
      data['Blood_Group'] = bloodGroup!.map((v) => v.toJson()).toList();
    }
    if (industrieslist != null) {
      data['Industrieslist'] =
          industrieslist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Education {
  String? educationId;
  String? educationName;

  Education({this.educationId, this.educationName});

  Education.fromJson(Map<String, dynamic> json) {
    educationId = json['education_id'];
    educationName = json['education_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['education_id'] = educationId;
    data['education_name'] = educationName;
    return data;
  }
}

class VillageBasic {
  String? vId;
  String? vName;
  String? vState;
  String? vDistrict;

  VillageBasic({this.vId, this.vName, this.vState, this.vDistrict});

  VillageBasic.fromJson(Map<String, dynamic> json) {
    vId = json['V_id'];
    vName = json['V_name'];
    vState = json['V_state'];
    vDistrict = json['V_district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['V_id'] = vId;
    data['V_name'] = vName;
    data['V_state'] = vState;
    data['V_district'] = vDistrict;
    return data;
  }
}

class Married {
  String? marriedId;
  String? marriedName;

  Married({this.marriedId, this.marriedName});

  Married.fromJson(Map<String, dynamic> json) {
    marriedId = json['married_id'];
    marriedName = json['married_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['married_id'] = marriedId;
    data['married_name'] = marriedName;
    return data;
  }
}

class Home {
  String? homeId;
  String? homeName;

  Home({this.homeId, this.homeName});

  Home.fromJson(Map<String, dynamic> json) {
    homeId = json['home_id'];
    homeName = json['home_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['home_id'] = homeId;
    data['home_name'] = homeName;
    return data;
  }
}

class BloodGroup {
  String? bId;
  String? bName;

  BloodGroup({this.bId, this.bName});

  BloodGroup.fromJson(Map<String, dynamic> json) {
    bId = json['b_id'];
    bName = json['b_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['b_id'] = bId;
    data['b_name'] = bName;
    return data;
  }
}

class IndustrieslistBasic {
  String? id;
  String? name;

  IndustrieslistBasic({this.id, this.name});

  IndustrieslistBasic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
