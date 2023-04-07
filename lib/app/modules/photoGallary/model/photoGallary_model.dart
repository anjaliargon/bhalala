class Gallary {
  int? status;
  List<Data>? data;

  Gallary({this.status, this.data});

  Gallary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? imageId;
  String? albumYear;
  String? albumName;
  String? imageUrl;
  String? imageName;
  Null? createdAt;
  Null? updatedAt;

  Data(
      {this.imageId,
        this.albumYear,
        this.albumName,
        this.imageUrl,
        this.imageName,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    albumYear = json['album_year'];
    albumName = json['album_name'];
    imageUrl = json['image_url'];
    imageName = json['image_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['album_year'] = this.albumYear;
    data['album_name'] = this.albumName;
    data['image_url'] = this.imageUrl;
    data['image_name'] = this.imageName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
