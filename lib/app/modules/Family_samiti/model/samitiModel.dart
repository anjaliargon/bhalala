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
  String? phone;

  smitiData(
      {this.id,
        this.picture,
        this.name,
        this.role,
        this.samityType,
        this.phone});

  smitiData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    picture = json['Picture'];
    name = json['Name'];
    role = json['Role'];
    samityType = json['samity_type'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Picture'] = this.picture;
    data['Name'] = this.name;
    data['Role'] = this.role;
    data['samity_type'] = this.samityType;
    data['Phone'] = this.phone;
    return data;
  }
}
