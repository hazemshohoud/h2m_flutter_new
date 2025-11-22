// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsRequestBody _$GetItemsRequestBodyFromJson(Map<String, dynamic> json) =>
    GetItemsRequestBody(
      name_montag: json['name_montag'] as String,
      id_mkhzan: (json['id_mkhzan'] as num).toInt(),
      AvergSerSHra: json['AvergSerSHra'] as String,
      id_mosam: (json['id_mosam'] as num).toInt(),
      NumberOfPage: (json['NumberOfPage'] as num).toInt(),
      id_sanf_hiden: (json['id_sanf_hiden'] as num).toInt(),
    );

Map<String, dynamic> _$GetItemsRequestBodyToJson(
        GetItemsRequestBody instance) =>
    <String, dynamic>{
      'name_montag': instance.name_montag,
      'id_mkhzan': instance.id_mkhzan,
      'AvergSerSHra': instance.AvergSerSHra,
      'id_mosam': instance.id_mosam,
      'NumberOfPage': instance.NumberOfPage,
      'id_sanf_hiden': instance.id_sanf_hiden,
    };
