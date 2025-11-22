import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_cust_payments_request_body.g.dart';

@JsonSerializable()
class AddCustPaymentsRequestBody {
  final int id_mosam_bee_omla;
  final int id_amel;
  final String date_hrka;
  final String wasf_harka;
  final String khzna;
  final double mplegh_mdfo;
  final int id_wardia;
  final int id_frea_shrka;
  final int id_mandob;
  AddCustPaymentsRequestBody({
    required this.id_mosam_bee_omla,
    required this.id_amel,
    required this.date_hrka,
    required this.wasf_harka,
    required this.khzna,
    required this.mplegh_mdfo,
    required this.id_wardia,
    required this.id_frea_shrka,
    required this.id_mandob
  
    });

  Map<String, dynamic> toJson() => _$AddCustPaymentsRequestBodyToJson(this);
}
