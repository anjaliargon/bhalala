class Parivarsamiti {
  int? status;
  List<smitiData>? data;

  Parivarsamiti({this.status, this.data});

  Parivarsamiti.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <smitiData>[];
      json['data'].forEach((v) {
        data!.add(new smitiData.fromJson(v));
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

class smitiData {
  String? id;
  String? picture;
  String? name;
  String? role;
  String? samityType;
  String? samityTypeName;
  String? phone;
  String? villageName;

  smitiData(
      {this.id,
        this.picture,
        this.name,
        this.role,
        this.samityType,
        this.samityTypeName,
        this.phone,
        this.villageName});

  smitiData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    picture = json['Picture'];
    name = json['Name'];
    role = json['Role'];
    samityType = json['samity_type'];
    samityTypeName = json['samity_type_name'];
    phone = json['Phone'];
    villageName = json['village_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Picture'] = this.picture;
    data['Name'] = this.name;
    data['Role'] = this.role;
    data['samity_type'] = this.samityType;
    data['samity_type_name'] = this.samityTypeName;
    data['Phone'] = this.phone;
    data['village_name'] = this.villageName;
    return data;
  }
}
