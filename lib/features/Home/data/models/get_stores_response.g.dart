// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stores_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchesResponse _$GetBranchesResponseFromJson(Map<String, dynamic> json) =>
    GetBranchesResponse(
      (json['Idmakhzan'] as num?)?.toInt(),
      json['NameMakjzan'] as String?,
    );

Map<String, dynamic> _$GetBranchesResponseToJson(
        GetBranchesResponse instance) =>
    <String, dynamic>{
      'Idmakhzan': instance.Idmakhzan,
      'NameMakjzan': instance.NameMakjzan,
    };
