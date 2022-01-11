import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  DataBean? data;
  String? message;
  bool? status;

  HomeModel({this.data, this.message, this.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class DataBean {
  List<BannersBean>? banners;
  List<CategoryBean>? Category;
  List<CompetitonsBean>? competitons;
  List<InstructorsBean>? instructors;
  List<OffersBean>? offers;
  List<StudentsBean>? students;
  dynamic services;
  List<VideoBean>? Video;

  DataBean({this.banners, this.Category, this.competitons, this.instructors, this.offers, this.students, this.services, this.Video});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class VideoBean {
  num? id;
  String? name;
  String? image;

  VideoBean({this.id, this.name, this.image});

  factory VideoBean.fromJson(Map<String, dynamic> json) => _$VideoBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VideoBeanToJson(this);
}

@JsonSerializable()
class StudentsBean {
  num? id;
  String? name;
  String? image;

  StudentsBean({this.id, this.name, this.image});

  factory StudentsBean.fromJson(Map<String, dynamic> json) => _$StudentsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsBeanToJson(this);
}

@JsonSerializable()
class OffersBean {
  num? id;
  String? name;
  String? image;

  OffersBean({this.id, this.name, this.image});

  factory OffersBean.fromJson(Map<String, dynamic> json) => _$OffersBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OffersBeanToJson(this);
}

@JsonSerializable()
class InstructorsBean {
  num? id;
  String? name;
  String? image;

  InstructorsBean({this.id, this.name, this.image});

  factory InstructorsBean.fromJson(Map<String, dynamic> json) => _$InstructorsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorsBeanToJson(this);
}

@JsonSerializable()
class CompetitonsBean {
  num? id;
  String? name;
  String? image;

  CompetitonsBean({this.id, this.name, this.image});

  factory CompetitonsBean.fromJson(Map<String, dynamic> json) => _$CompetitonsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitonsBeanToJson(this);
}

@JsonSerializable()
class CategoryBean {
  num? id;
  String? name;
  String? image;
  String? created_at;
  String? updated_at;

  CategoryBean({this.id, this.name, this.image, this.created_at, this.updated_at});

  factory CategoryBean.fromJson(Map<String, dynamic> json) => _$CategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);
}

@JsonSerializable()
class BannersBean {
  num? id;
  String? name;
  String? image;

  BannersBean({this.id, this.name, this.image});

  factory BannersBean.fromJson(Map<String, dynamic> json) => _$BannersBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannersBeanToJson(this);
}

