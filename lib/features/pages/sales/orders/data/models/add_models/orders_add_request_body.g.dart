// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_add_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersAddRequestBody _$OrdersAddRequestBodyFromJson(
        Map<String, dynamic> json) =>
    OrdersAddRequestBody(
      date_ordar: DateTime.parse(json['date_ordar'] as String),
      id_amel: (json['id_amel'] as num).toInt(),
      wasf_fatora: json['wasf_fatora'] as String,
      sealse_mane: json['sealse_mane'] as String,
      egmaley_fatora: json['egmaley_fatora'] as String,
      nakdey: json['nakdey'] as String,
      agel: json['agel'] as String,
      agkhsm_nkdeyel: json['agkhsm_nkdeyel'] as String,
      safey: json['safey'] as String,
      khdmet_twsel: json['khdmet_twsel'] as String,
      id_wrdya: (json['id_wrdya'] as num).toInt(),
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      id_mosam_bee_order: (json['id_mosam_bee_order'] as num).toInt(),
      id_last_name: (json['id_last_name'] as num).toInt(),
      mplegh_shra: (json['mplegh_shra'] as num).toDouble(),
      nowa_fatora: json['nowa_fatora'] as String,
      khzna: json['khzna'] as String,
    );

Map<String, dynamic> _$OrdersAddRequestBodyToJson(
        OrdersAddRequestBody instance) =>
    <String, dynamic>{
      'date_ordar': instance.date_ordar.toIso8601String(),
      'id_amel': instance.id_amel,
      'wasf_fatora': instance.wasf_fatora,
      'sealse_mane': instance.sealse_mane,
      'egmaley_fatora': instance.egmaley_fatora,
      'nakdey': instance.nakdey,
      'agel': instance.agel,
      'agkhsm_nkdeyel': instance.agkhsm_nkdeyel,
      'safey': instance.safey,
      'khdmet_twsel': instance.khdmet_twsel,
      'id_wrdya': instance.id_wrdya,
      'id_frea_shrka': instance.id_frea_shrka,
      'id_mosam_bee_order': instance.id_mosam_bee_order,
      'id_last_name': instance.id_last_name,
      'mplegh_shra': instance.mplegh_shra,
      'nowa_fatora': instance.nowa_fatora,
      'khzna': instance.khzna,
    };
