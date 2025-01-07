// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingUpResponseModel _$SingUpResponseModelFromJson(Map<String, dynamic> json) =>
    SingUpResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SingUpResponseModelToJson(
        SingUpResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      token: json['token'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
    };
