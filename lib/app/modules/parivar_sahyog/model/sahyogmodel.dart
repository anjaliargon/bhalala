class Parivarsahyog {
  int? status;
  List<sahyogData>? data;

  Parivarsahyog({this.status, this.data});

  Parivarsahyog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <sahyogData>[];
      json['data'].forEach((v) {
        data!.add(new sahyogData.fromJson(v));
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

class sahyogData {
  String? id;
  String? picture;
  String? title;
  String? description;

  sahyogData({this.id, this.picture, this.title, this.description});

  sahyogData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['Picture'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Picture'] = this.picture;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
