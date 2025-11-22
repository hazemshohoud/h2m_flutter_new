import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cust_payments_response.g.dart';

@JsonSerializable()
class AddCustPaymentsResponse {
  int? IdHrketOmla;

  AddCustPaymentsResponse(
      this.IdHrketOmla,
      
      );

  factory AddCustPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCustPaymentsResponseFromJson(json);
}
