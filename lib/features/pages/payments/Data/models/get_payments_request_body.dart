import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_payments_request_body.g.dart';

@JsonSerializable()
class GetPaymentsRequestBody {
  final int id_mosam_bee_omla;
  final String date1;
  final String date2;
  final int id_frea_shrka;
  final int quentomla;
  GetPaymentsRequestBody({
    required this.id_mosam_bee_omla,
    required this.date1,
    required this.date2,
    required this.id_frea_shrka,
    required this.quentomla,
    });

  Map<String, dynamic> toJson() => _$GetPaymentsRequestBodyToJson(this);
}
