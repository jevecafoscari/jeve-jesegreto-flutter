import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'secret_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SecretModel {
  final String id;
  final DateTime dateTime;
  AuthorModel author;

  final String body;
  String? attachmentUrl;

  SecretModel({
    required this.id,
    required this.dateTime,
    required this.author,
    required this.body,
    this.attachmentUrl,
  });

  factory SecretModel.fromJson(Map<String, dynamic> json) => _$SecretModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecretModelToJson(this);
}
