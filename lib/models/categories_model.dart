import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  List<DataBean>? data;
  String? message;
  bool? status;

  CategoriesModel({this.data, this.message, this.status});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class DataBean {
  num? id;
  String? name;
  String? image;

  DataBean({this.id, this.name, this.image});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

