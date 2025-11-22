// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payments_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentsResponse _$GetPaymentsResponseFromJson(Map<String, dynamic> json) =>
    GetPaymentsResponse(
      (json['IdHrka'] as num?)?.toInt(),
      (json['IdAmel'] as num?)?.toInt(),
      json['Nkdeey'] as bool?,
      json['NameAmel'] as String?,
      (json['Mohsal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetPaymentsResponseToJson(
        GetPaymentsResponse instance) =>
    <String, dynamic>{
      'IdHrka': instance.IdHrka,
      'IdAmel': instance.IdAmel,
      'Nkdeey': instance.Nkdeey,
      'NameAmel': instance.NameAmel,
      'Mohsal': instance.Mohsal,
    };
