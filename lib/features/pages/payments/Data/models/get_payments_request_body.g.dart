// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payments_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentsRequestBody _$GetPaymentsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetPaymentsRequestBody(
      id_mosam_bee_omla: (json['id_mosam_bee_omla'] as num).toInt(),
      date1: json['date1'] as String,
      date2: json['date2'] as String,
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      quentomla: (json['quentomla'] as num).toInt(),
    );

Map<String, dynamic> _$GetPaymentsRequestBodyToJson(
        GetPaymentsRequestBody instance) =>
    <String, dynamic>{
      'id_mosam_bee_omla': instance.id_mosam_bee_omla,
      'date1': instance.date1,
      'date2': instance.date2,
      'id_frea_shrka': instance.id_frea_shrka,
      'quentomla': instance.quentomla,
    };
