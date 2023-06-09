class Gallary_year {
  int? status;
  List<gallaryData_year>? data;

  Gallary_year({this.status, this.data});

  Gallary_year.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <gallaryData_year>[];
      json['data'].forEach((v) {
        data!.add(new gallaryData_year.fromJson(v));
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

class gallaryData_year {
  String? albumName;
  String? albumYear;
  String? id;
  Null? createdAt;
  Null? updatedAt;

  gallaryData_year(
      {this.albumName,
        this.albumYear,
        this.id,
        this.createdAt,
        this.updatedAt});

  gallaryData_year.fromJson(Map<String, dynamic> json) {
    albumName = json['album_name'];
    albumYear = json['album_year'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_name'] = this.albumName;
    data['album_year'] = this.albumYear;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
