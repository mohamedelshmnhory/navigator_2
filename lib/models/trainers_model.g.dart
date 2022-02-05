// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainersModel _$TrainersModelFromJson(Map<String, dynamic> json) =>
    TrainersModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$TrainersModelToJson(TrainersModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      specialty: json['specialty'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      birthday: json['birthday'] as String?,
      user_id: json['user_id'],
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'specialty': instance.specialty,
      'education': instance.education,
      'experience': instance.experience,
      'birthday': instance.birthday,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
