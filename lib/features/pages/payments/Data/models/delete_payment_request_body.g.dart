// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_payment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePaymentRequestBody _$DeletePaymentRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DeletePaymentRequestBody(
      id_hrka: (json['id_hrka'] as num).toInt(),
      date_hrka: json['date_hrka'] as String,
      user_Name: json['user_Name'] as String,
    );

Map<String, dynamic> _$DeletePaymentRequestBodyToJson(
        DeletePaymentRequestBody instance) =>
    <String, dynamic>{
      'id_hrka': instance.id_hrka,
      'date_hrka': instance.date_hrka,
      'user_Name': instance.user_Name,
    };
