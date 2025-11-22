// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_by_id_requestbody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemByIdRequestBody _$GetItemByIdRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetItemByIdRequestBody(
      id_montag: (json['id_montag'] as num).toInt(),
      id_mkhzan: (json['id_mkhzan'] as num).toInt(),
      id_mosam: (json['id_mosam'] as num).toInt(),
      AvergSerSHra: json['AvergSerSHra'] as String,
    );

Map<String, dynamic> _$GetItemByIdRequestBodyToJson(
        GetItemByIdRequestBody instance) =>
    <String, dynamic>{
      'id_montag': instance.id_montag,
      'id_mkhzan': instance.id_mkhzan,
      'id_mosam': instance.id_mosam,
      'AvergSerSHra': instance.AvergSerSHra,
    };
