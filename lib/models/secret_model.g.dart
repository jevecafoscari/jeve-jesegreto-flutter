// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretModel _$SecretModelFromJson(Map<String, dynamic> json) => SecretModel(
      id: json['id'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecretModelToJson(SecretModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime.toIso8601String(),
      'author': instance.author.toJson(),
    };
