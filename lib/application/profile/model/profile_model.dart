class ProfileModel {
  String? message;
  Data? data;

  ProfileModel({this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
  Null? plan;
  String? role;
  bool? isActive;
  String? dateJoined;
  String? lastLogin;

  Data(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.phone,
      this.plan,
      this.role,
      this.isActive,
      this.dateJoined,
      this.lastLogin});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    plan = json['plan'];
    role = json['role'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['plan'] = this.plan;
    data['role'] = this.role;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['last_login'] = this.lastLogin;
    return data;
  }
}
