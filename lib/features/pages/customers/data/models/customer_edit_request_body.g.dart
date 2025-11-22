// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_edit_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerEditRequestBody _$CustomerEditRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CustomerEditRequestBody(
      id_amel: (json['id_amel'] as num).toInt(),
      first_name: json['first_name'] as String,
      mndonName: (json['mndonName'] as num).toInt(),
      tel: json['tel'] as String,
      email: json['email'] as String,
      NowAmel: json['NowAmel'] as String,
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerEditRequestBodyToJson(
        CustomerEditRequestBody instance) =>
    <String, dynamic>{
      'id_amel': instance.id_amel,
      'first_name': instance.first_name,
      'mndonName': instance.mndonName,
      'tel': instance.tel,
      'email': instance.email,
      'NowAmel': instance.NowAmel,
      'id_frea_shrka': instance.id_frea_shrka,
    };
