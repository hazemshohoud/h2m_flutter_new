import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_details_requet_body.g.dart';

@JsonSerializable()
class OrdersDetailsRequestBody {
  final int id_montag;
  final String name_montag;
  final int id_ordars;
  final double qunttey;
  final double price;
  final double discount;
  final double amount;
  final double total_amount;
  final String note;
  final String mkhzan;
  final double ser_shra;
  final int id_mkzan;
  final int id_mosam_bee;
  final int id_wrdya;
  final int id_frea_shrka;
  final int id_khdma;
  final int montg_tsne;
  final int id_edaa;
  final String date_hrka;
  OrdersDetailsRequestBody(
      {required this.id_montag,
      required this.name_montag,
      required this.id_ordars,
      required this.qunttey,
      required this.price,
      required this.discount,
      required this.amount,
      required this.total_amount,
      required this.note,
      required this.mkhzan,
      required this.ser_shra,
      required this.id_mkzan,
      required this.id_mosam_bee,
      required this.id_wrdya,
      required this.id_frea_shrka,
      required this.id_khdma,
      required this.montg_tsne,
      required this.id_edaa,
      required this.date_hrka});
  Map<String, dynamic> toJson() => _$OrdersDetailsRequestBodyToJson(this);
}
