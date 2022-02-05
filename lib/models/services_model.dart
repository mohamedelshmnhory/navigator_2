import 'package:json_annotation/json_annotation.dart';

part 'services_model.g.dart';

@JsonSerializable()
class ServicesModel {
  List<Service>? data;
  String? message;
  bool? status;

  ServicesModel({this.data, this.message, this.status});

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);
}

@JsonSerializable()
class Service {
  int? id;
  String? name;
  String? image;
  int? active;
  String? description;
  String? fullDescription;

  Service(
      {this.id,
      this.name,
      this.image,
      this.active,
      this.description,
      this.fullDescription});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
