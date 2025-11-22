import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_payments_reponse.g.dart';

@JsonSerializable()
class GetPaymentsResponse {
  int? IdHrka;
  int? IdAmel;
  bool? Nkdeey;
  String? NameAmel;
  double? Mohsal;

  GetPaymentsResponse(
    this.IdHrka,
    this.IdAmel,
    this.Nkdeey,
    this.NameAmel,
    this.Mohsal,
  );

  factory GetPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentsResponseFromJson(json);
}
