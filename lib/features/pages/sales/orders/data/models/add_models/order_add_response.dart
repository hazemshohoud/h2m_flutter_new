
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_add_response.g.dart';

@JsonSerializable()
class OrderAddResponse {
  int? IdOrder;
  OrderAddResponse( {
    this.IdOrder,
  });

  factory OrderAddResponse.fromJson(Map<String, dynamic> json) => _$OrderAddResponseFromJson(json);

}