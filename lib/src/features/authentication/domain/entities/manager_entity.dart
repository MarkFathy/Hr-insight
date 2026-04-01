class ManagerEntity {
  int? status;
  String? message;
  TokenDataEntity? data;

  ManagerEntity({this.status, this.message, this.data});

  ManagerEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TokenDataEntity.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TokenDataEntity {
  String? token;
  ManagerDataEntity? manager;

  TokenDataEntity({this.token, this.manager});

  TokenDataEntity.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    manager =
        json['data'] != null ? ManagerDataEntity.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (manager != null) {
      data['data'] = manager!.toJson();
    }
    return data;
  }
}

class ManagerDataEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? pin;
  String? status;
  String? company;
  String? createdAt;
  String? updatedAt;

  ManagerDataEntity(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.pin,
      this.status,
      this.company,
      this.createdAt,
      this.updatedAt});

  ManagerDataEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    pin = json['pin'];
    status = json['status'];
    company = json['company'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['pin'] = pin;
    data['status'] = status;
    data['company'] = company;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
