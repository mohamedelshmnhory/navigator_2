// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificationsModel _$CertificationsModelFromJson(Map<String, dynamic> json) =>
    CertificationsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Certification.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$CertificationsModelToJson(
        CertificationsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    Certification(
      id: json['id'] as int,
      license: json['license'] as String,
      numberLicense: json['numberLicense'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CertificationToJson(Certification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'license': instance.license,
      'numberLicense': instance.numberLicense,
      'image': instance.image,
    };
