// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) => CoursesModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$CoursesModelToJson(CoursesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      lectures: json['lectures'] as num?,
      duration: json['duration'] as num?,
      level: json['level'] as num?,
      language: json['language'] as String?,
      assessments: json['assessments'] as num?,
      description: json['description'] as String?,
      certification: json['certification'] as String?,
      fullDescription: json['fullDescription'] as String?,
      active: json['active'] as num?,
      price: json['price'] as num?,
      list: json['list'] as String?,
      instructor_id: json['instructor_id'] as num?,
      categories_id: json['categories_id'] as num?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'lectures': instance.lectures,
      'duration': instance.duration,
      'level': instance.level,
      'language': instance.language,
      'assessments': instance.assessments,
      'description': instance.description,
      'certification': instance.certification,
      'fullDescription': instance.fullDescription,
      'active': instance.active,
      'price': instance.price,
      'list': instance.list,
      'instructor_id': instance.instructor_id,
      'categories_id': instance.categories_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
