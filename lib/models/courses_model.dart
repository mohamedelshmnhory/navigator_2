import 'package:json_annotation/json_annotation.dart';

part 'courses_model.g.dart';

@JsonSerializable()
class CoursesModel {
  List<Course> data;
  String message;
  bool status;

  CoursesModel({required this.data, required this.message, required this.status});

  factory CoursesModel.fromJson(Map<String, dynamic> json) => _$CoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesModelToJson(this);
}

@JsonSerializable()
class Course {
  num? id;
  String? name;
  String? image;
  num? lectures;
  num? duration;
  num? level;
  String? language;
  num? assessments;
  String? description;
  String? certification;
  String? fullDescription;
  num? active;
  num? price;
  String? list;
  num? instructor_id;
  num? categories_id;
  String? created_at;
  String? updated_at;

  Course({this.id, this.name, this.image, this.lectures, this.duration, this.level, this.language, this.assessments, this.description, this.certification, this.fullDescription, this.active, this.price, this.list, this.instructor_id, this.categories_id, this.created_at, this.updated_at});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

