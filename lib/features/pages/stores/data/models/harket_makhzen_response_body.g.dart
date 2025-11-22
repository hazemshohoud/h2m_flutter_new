// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harket_makhzen_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarketMakhzenResponseBody _$HarketMakhzenResponseBodyFromJson(
        Map<String, dynamic> json) =>
    HarketMakhzenResponseBody(
      idMontag: (json['idMontag'] as num).toInt(),
      nameMontag: json['nameMontag'] as String,
      quntetyMpeat: (json['quntetyMpeat'] as num).toDouble(),
      rased: (json['rased'] as num).toDouble(),
    );

Map<String, dynamic> _$HarketMakhzenResponseBodyToJson(
        HarketMakhzenResponseBody instance) =>
    <String, dynamic>{
      'idMontag': instance.idMontag,
      'nameMontag': instance.nameMontag,
      'quntetyMpeat': instance.quntetyMpeat,
      'rased': instance.rased,
    };
