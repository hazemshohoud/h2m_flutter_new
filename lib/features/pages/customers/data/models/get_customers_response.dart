
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_customers_response.g.dart';

@JsonSerializable()
class GetCustomersResponse {
  int? idAmel;
  String? nameAMel;
  String? mandobName;
  String? tel;
  String? email;
  String? nowAmel;
  int? creditAmel;

  GetCustomersResponse( {

    this.idAmel,
    this.nameAMel,
    this.mandobName,
    this.tel,
    this.email,
    this.nowAmel,
    this.creditAmel,
  });

  factory GetCustomersResponse.fromJson(Map<String, dynamic> json) => _$GetCustomersResponseFromJson(json);

}