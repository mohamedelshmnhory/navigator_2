import 'package:json_annotation/json_annotation.dart';

import 'courses_model.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  Course? data;
  String? message;
  bool? status;

  CourseModel({required this.data, required this.message, required this.status});

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

