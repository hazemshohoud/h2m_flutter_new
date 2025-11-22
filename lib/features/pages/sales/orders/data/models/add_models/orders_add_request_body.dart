import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_add_request_body.g.dart';

@JsonSerializable()
class OrdersAddRequestBody {
  final DateTime date_ordar;
  final int id_amel;
  final String wasf_fatora;
  final String sealse_mane;
  final String egmaley_fatora;
  final String nakdey;
  final String agel;
  final String agkhsm_nkdeyel;
  final String safey;
  final String khdmet_twsel;
  final int id_wrdya;
  final int id_frea_shrka;
  final int id_mosam_bee_order;
  final int id_last_name;
  final double mplegh_shra;
  final String nowa_fatora;
  final String khzna;
  OrdersAddRequestBody(
      {
       required this.date_ordar,
       required this.id_amel,
       required this.wasf_fatora,
       required this.sealse_mane,
       required this.egmaley_fatora,
       required this.nakdey,
       required this.agel,
       required this.agkhsm_nkdeyel,
       required this.safey,
       required this.khdmet_twsel,
       required this.id_wrdya,
       required this.id_frea_shrka,
       required this.id_mosam_bee_order,
       required this.id_last_name,
       required this.mplegh_shra,
       required this.nowa_fatora,
       required this.khzna
      });
  Map<String, dynamic> toJson() => _$OrdersAddRequestBodyToJson(this);
}