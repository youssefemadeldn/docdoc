// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_up_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingUpRequestBodyModel _$SingUpRequestBodyModelFromJson(
        Map<String, dynamic> json) =>
    SingUpRequestBodyModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$SingUpRequestBodyModelToJson(
        SingUpRequestBodyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
