
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  int? IdOrder;
  OrderDetailsResponse( {
    this.IdOrder,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailsResponseFromJson(json);

}