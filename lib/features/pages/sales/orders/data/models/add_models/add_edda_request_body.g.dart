// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edda_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEddaRequestBody _$AddEddaRequestBodyFromJson(Map<String, dynamic> json) =>
    AddEddaRequestBody(
      date_hrka: json['date_hrka'] as String,
      id_edaa: (json['id_edaa'] as num).toInt(),
      id_mndob: (json['id_mndob'] as num).toInt(),
      sader: (json['sader'] as num).toDouble(),
      wared: (json['wared'] as num).toInt(),
      id_order: (json['id_order'] as num).toInt(),
      twred: json['twred'] as String,
      id_mkzan: json['id_mkzan'] as String,
      id_mosam: (json['id_mosam'] as num).toInt(),
      byan: json['byan'] as String,
    );

Map<String, dynamic> _$AddEddaRequestBodyToJson(AddEddaRequestBody instance) =>
    <String, dynamic>{
      'date_hrka': instance.date_hrka,
      'id_edaa': instance.id_edaa,
      'id_mndob': instance.id_mndob,
      'sader': instance.sader,
      'wared': instance.wared,
      'id_order': instance.id_order,
      'twred': instance.twred,
      'id_mkzan': instance.id_mkzan,
      'id_mosam': instance.id_mosam,
      'byan': instance.byan,
    };
