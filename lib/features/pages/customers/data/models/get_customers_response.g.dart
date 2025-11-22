// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersResponse _$GetCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponse(
      idAmel: (json['idAmel'] as num?)?.toInt(),
      nameAMel: json['nameAMel'] as String?,
      mandobName: json['mandobName'] as String?,
      tel: json['tel'] as String?,
      email: json['email'] as String?,
      nowAmel: json['nowAmel'] as String?,
      creditAmel: (json['creditAmel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetCustomersResponseToJson(
        GetCustomersResponse instance) =>
    <String, dynamic>{
      'idAmel': instance.idAmel,
      'nameAMel': instance.nameAMel,
      'mandobName': instance.mandobName,
      'tel': instance.tel,
      'email': instance.email,
      'nowAmel': instance.nowAmel,
      'creditAmel': instance.creditAmel,
    };
