import 'package:json_annotation/json_annotation.dart';

part 'certifications_model.g.dart';

@JsonSerializable()
class CertificationsModel {
  List<Certification>? data;
  String? message;
  bool? status;

  CertificationsModel({this.data, this.message, this.status});

  factory CertificationsModel.fromJson(Map<String, dynamic> json) =>
      _$CertificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationsModelToJson(this);
}

@JsonSerializable()
class Certification {
  int id;
  String license;
  String numberLicense;
  String image;

  Certification(
      {required this.id,
      required this.license,
      required this.numberLicense,
      required this.image});

  factory Certification.fromJson(Map<String, dynamic> json) =>
      _$CertificationFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationToJson(this);
}
