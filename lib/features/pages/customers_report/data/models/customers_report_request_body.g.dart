// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomersReportRequestBody _$CustomersReportRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CustomersReportRequestBody(
      date1: json['date1'] as String,
      date2: json['date2'] as String,
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      id_mosam_bee_omla: (json['id_mosam_bee_omla'] as num).toInt(),
      id_amel: (json['id_amel'] as num).toInt(),
      qountPage: (json['qountPage'] as num).toInt(),
    );

Map<String, dynamic> _$CustomersReportRequestBodyToJson(
        CustomersReportRequestBody instance) =>
    <String, dynamic>{
      'date1': instance.date1,
      'date2': instance.date2,
      'id_frea_shrka': instance.id_frea_shrka,
      'id_mosam_bee_omla': instance.id_mosam_bee_omla,
      'id_amel': instance.id_amel,
      'qountPage': instance.qountPage,
    };
