import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? message;
  DataBean? data;
  bool? status;

  UserModel({this.message, this.data, this.status});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class DataBean {
  UserBean? user;

  DataBean({this.user});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class UserBean {
  num? id;
  String? name;
  String? email;
  dynamic email_verified_at;
  String? token;
  String? created_at;
  String? updated_at;

  UserBean({this.id, this.name, this.email, this.email_verified_at, this.token, this.created_at, this.updated_at});

  factory UserBean.fromJson(Map<String, dynamic> json) => _$UserBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UserBeanToJson(this);
}

