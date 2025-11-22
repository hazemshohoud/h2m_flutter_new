// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mandoben_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMandobenResponse _$GetMandobenResponseFromJson(Map<String, dynamic> json) =>
    GetMandobenResponse(
      (json['IdMndob'] as num?)?.toInt(),
      json['NameMandob'] as String?,
    );

Map<String, dynamic> _$GetMandobenResponseToJson(
        GetMandobenResponse instance) =>
    <String, dynamic>{
      'IdMndob': instance.IdMndob,
      'NameMandob': instance.NameMandob,
    };
