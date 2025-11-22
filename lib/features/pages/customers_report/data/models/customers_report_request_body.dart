import 'package:freezed_annotation/freezed_annotation.dart';
part 'customers_report_request_body.g.dart';

@JsonSerializable()
class CustomersReportRequestBody {
  final String date1;
  final String date2;
  final int id_frea_shrka;
  final int id_mosam_bee_omla;
  final int id_amel;
  final int qountPage;
  CustomersReportRequestBody(
      {required this.date1,
      required this.date2,
      required this.id_frea_shrka,
      required this.id_mosam_bee_omla,
      required this.id_amel,
      required this.qountPage});

  Map<String, dynamic> toJson() => _$CustomersReportRequestBodyToJson(this);
}
