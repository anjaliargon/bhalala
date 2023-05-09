class MemberCount {
  int? status;
  List<memberData>? data;

  MemberCount({this.status, this.data});

  MemberCount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <memberData>[];
      json['data'].forEach((v) {
        data!.add(memberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
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
    json['village'] != null ? Village.fromJson(json['village']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['all_memeber'] = allMemeber;
    if (village != null) {
      data['village'] = village!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['V_id'] = vId;
    data['V_name'] = vName;
    data['V_state'] = vState;
    data['V_district'] = vDistrict;
    return data;
  }
}
