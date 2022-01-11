// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      user: json['user'] == null
          ? null
          : UserBean.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'user': instance.user,
    };

UserBean _$UserBeanFromJson(Map<String, dynamic> json) => UserBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'],
      token: json['token'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'token': instance.token,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
