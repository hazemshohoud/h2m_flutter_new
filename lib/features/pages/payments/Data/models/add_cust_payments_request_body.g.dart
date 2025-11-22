// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cust_payments_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCustPaymentsRequestBody _$AddCustPaymentsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddCustPaymentsRequestBody(
      id_mosam_bee_omla: (json['id_mosam_bee_omla'] as num).toInt(),
      id_amel: (json['id_amel'] as num).toInt(),
      date_hrka: json['date_hrka'] as String,
      wasf_harka: json['wasf_harka'] as String,
      khzna: json['khzna'] as String,
      mplegh_mdfo: (json['mplegh_mdfo'] as num).toDouble(),
      id_wardia: (json['id_wardia'] as num).toInt(),
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      id_mandob: (json['id_mandob'] as num).toInt(),
    );

Map<String, dynamic> _$AddCustPaymentsRequestBodyToJson(
        AddCustPaymentsRequestBody instance) =>
    <String, dynamic>{
      'id_mosam_bee_omla': instance.id_mosam_bee_omla,
      'id_amel': instance.id_amel,
      'date_hrka': instance.date_hrka,
      'wasf_harka': instance.wasf_harka,
      'khzna': instance.khzna,
      'mplegh_mdfo': instance.mplegh_mdfo,
      'id_wardia': instance.id_wardia,
      'id_frea_shrka': instance.id_frea_shrka,
      'id_mandob': instance.id_mandob,
    };
