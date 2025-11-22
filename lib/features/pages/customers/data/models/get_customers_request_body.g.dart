// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersRequestBody _$GetCustomersRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetCustomersRequestBody(
      name: json['name'] as String,
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      quentomla: (json['quentomla'] as num).toInt(),
    );

Map<String, dynamic> _$GetCustomersRequestBodyToJson(
        GetCustomersRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id_frea_shrka': instance.id_frea_shrka,
      'quentomla': instance.quentomla,
    };
