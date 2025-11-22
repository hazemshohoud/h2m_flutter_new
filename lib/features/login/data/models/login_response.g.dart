// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user_id: (json['user_id'] as num?)?.toInt(),
      user_namee: json['user_namee'] as String?,
      user_ful_name: json['user_ful_name'] as String?,
      admin: json['admin'] as bool?,
      Token: json['Token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_namee': instance.user_namee,
      'user_ful_name': instance.user_ful_name,
      'admin': instance.admin,
      'Token': instance.Token,
    };
