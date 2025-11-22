// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harket_makhzan_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarketMakhzanRequestBody _$HarketMakhzanRequestBodyFromJson(
        Map<String, dynamic> json) =>
    HarketMakhzanRequestBody(
      id_mkzan: (json['id_mkzan'] as num).toInt(),
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      date1: json['date1'] as String,
      date2: json['date2'] as String,
      id_mosam: (json['id_mosam'] as num).toInt(),
    );

Map<String, dynamic> _$HarketMakhzanRequestBodyToJson(
        HarketMakhzanRequestBody instance) =>
    <String, dynamic>{
      'id_mkzan': instance.id_mkzan,
      'id_frea_shrka': instance.id_frea_shrka,
      'date1': instance.date1,
      'date2': instance.date2,
      'id_mosam': instance.id_mosam,
    };
