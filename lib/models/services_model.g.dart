// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      active: json['active'] as int?,
      description: json['description'] as String?,
      fullDescription: json['fullDescription'] as String?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'active': instance.active,
      'description': instance.description,
      'fullDescription': instance.fullDescription,
    };
