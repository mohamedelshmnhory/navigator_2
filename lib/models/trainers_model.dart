import 'package:json_annotation/json_annotation.dart';

part 'trainers_model.g.dart';

@JsonSerializable()
class TrainersModel {
  List<Trainer>? data;
  String? message;
  bool? status;

  TrainersModel({this.data, this.message, this.status});

  factory TrainersModel.fromJson(Map<String, dynamic> json) => _$TrainersModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainersModelToJson(this);
}

@JsonSerializable()
class Trainer {
  num? id;
  String? name;
  String? email;
  String? title;
  String? description;
  String? image;
  String? specialty;
  String? education;
  String? experience;
  String? birthday;
  dynamic user_id;
  String? created_at;
  String? updated_at;

  Trainer({this.id, this.name, this.email, this.title, this.description, this.image, this.specialty, this.education, this.experience, this.birthday, this.user_id, this.created_at, this.updated_at});

  factory Trainer.fromJson(Map<String, dynamic> json) => _$TrainerFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerToJson(this);
}

