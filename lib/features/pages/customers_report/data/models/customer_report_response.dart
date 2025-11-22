import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_report_response.g.dart';

@JsonSerializable()
class CustomerReportResponse {
  List<dynamic>? data;
  CustomerReportResponse({
    this.data,
  });
  factory CustomerReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerReportResponseFromJson(json);
}
