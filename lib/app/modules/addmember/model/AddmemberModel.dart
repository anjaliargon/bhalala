class AddMember {
  int? status;
  String? message;
  List<String>? data;

  AddMember({this.status, this.message, this.data});

  AddMember.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
