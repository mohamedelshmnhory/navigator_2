// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      Category: (json['Category'] as List<dynamic>?)
          ?.map((e) => CategoryBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      competitons: (json['competitons'] as List<dynamic>?)
          ?.map((e) => CompetitonsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructors: (json['instructors'] as List<dynamic>?)
          ?.map((e) => InstructorsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => OffersBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: json['services'],
      Video: (json['Video'] as List<dynamic>?)
          ?.map((e) => VideoBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'banners': instance.banners,
      'Category': instance.Category,
      'competitons': instance.competitons,
      'instructors': instance.instructors,
      'offers': instance.offers,
      'students': instance.students,
      'services': instance.services,
      'Video': instance.Video,
    };

VideoBean _$VideoBeanFromJson(Map<String, dynamic> json) => VideoBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$VideoBeanToJson(VideoBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

StudentsBean _$StudentsBeanFromJson(Map<String, dynamic> json) => StudentsBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$StudentsBeanToJson(StudentsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

OffersBean _$OffersBeanFromJson(Map<String, dynamic> json) => OffersBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OffersBeanToJson(OffersBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

InstructorsBean _$InstructorsBeanFromJson(Map<String, dynamic> json) =>
    InstructorsBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$InstructorsBeanToJson(InstructorsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

CompetitonsBean _$CompetitonsBeanFromJson(Map<String, dynamic> json) =>
    CompetitonsBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CompetitonsBeanToJson(CompetitonsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

CategoryBean _$CategoryBeanFromJson(Map<String, dynamic> json) => CategoryBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategoryBeanToJson(CategoryBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

BannersBean _$BannersBeanFromJson(Map<String, dynamic> json) => BannersBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BannersBeanToJson(BannersBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
