// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_requet_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersDetailsRequestBody _$OrdersDetailsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailsRequestBody(
      id_montag: (json['id_montag'] as num).toInt(),
      name_montag: json['name_montag'] as String,
      id_ordars: (json['id_ordars'] as num).toInt(),
      qunttey: (json['qunttey'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      total_amount: (json['total_amount'] as num).toDouble(),
      note: json['note'] as String,
      mkhzan: json['mkhzan'] as String,
      ser_shra: (json['ser_shra'] as num).toDouble(),
      id_mkzan: (json['id_mkzan'] as num).toInt(),
      id_mosam_bee: (json['id_mosam_bee'] as num).toInt(),
      id_wrdya: (json['id_wrdya'] as num).toInt(),
      id_frea_shrka: (json['id_frea_shrka'] as num).toInt(),
      id_khdma: (json['id_khdma'] as num).toInt(),
      montg_tsne: (json['montg_tsne'] as num).toInt(),
      id_edaa: (json['id_edaa'] as num).toInt(),
      date_hrka: json['date_hrka'] as String,
    );

Map<String, dynamic> _$OrdersDetailsRequestBodyToJson(
        OrdersDetailsRequestBody instance) =>
    <String, dynamic>{
      'id_montag': instance.id_montag,
      'name_montag': instance.name_montag,
      'id_ordars': instance.id_ordars,
      'qunttey': instance.qunttey,
      'price': instance.price,
      'discount': instance.discount,
      'amount': instance.amount,
      'total_amount': instance.total_amount,
      'note': instance.note,
      'mkhzan': instance.mkhzan,
      'ser_shra': instance.ser_shra,
      'id_mkzan': instance.id_mkzan,
      'id_mosam_bee': instance.id_mosam_bee,
      'id_wrdya': instance.id_wrdya,
      'id_frea_shrka': instance.id_frea_shrka,
      'id_khdma': instance.id_khdma,
      'montg_tsne': instance.montg_tsne,
      'id_edaa': instance.id_edaa,
      'date_hrka': instance.date_hrka,
    };
