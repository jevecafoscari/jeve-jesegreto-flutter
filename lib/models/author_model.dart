import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  final String id;
  final int age;
  final Sex sex;

  const AuthorModel({
    required this.id,
    required this.age,
    required this.sex,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}

enum Sex { male, female, other }
