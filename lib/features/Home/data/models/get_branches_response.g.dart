// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_branches_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchesResponse _$GetBranchesResponseFromJson(Map<String, dynamic> json) =>
    GetBranchesResponse(
      (json['IdShrka'] as num?)?.toInt(),
      json['NameShrka'] as String?,
    );

Map<String, dynamic> _$GetBranchesResponseToJson(
        GetBranchesResponse instance) =>
    <String, dynamic>{
      'IdShrka': instance.IdShrka,
      'NameShrka': instance.NameShrka,
    };
