class MemberCount {
  int? status;
  List<memberData>? data;

  MemberCount({this.status, this.data});

  MemberCount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <memberData>[];
      json['data'].forEach((v) {
        data!.add(new memberData.fromJson(v));
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

class memberData {
  int? count;
  int? allMemeber;
  Village? village;

  memberData({this.count, this.allMemeber, this.village});

  memberData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    allMemeber = json['all_memeber'];
    village =
    json['village'] != null ? new Village.fromJson(json['village']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['all_memeber'] = this.allMemeber;
    if (this.village != null) {
      data['village'] = this.village!.toJson();
    }
    return data;
  }
}

class Village {
  String? vId;
  String? vName;
  String? vState;
  String? vDistrict;

  Village({this.vId, this.vName, this.vState, this.vDistrict});

  Village.fromJson(Map<String, dynamic> json) {
    vId = json['V_id'];
    vName = json['V_name'];
    vState = json['V_state'];
    vDistrict = json['V_district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['V_id'] = this.vId;
    data['V_name'] = this.vName;
    data['V_state'] = this.vState;
    data['V_district'] = this.vDistrict;
    return data;
  }
}
