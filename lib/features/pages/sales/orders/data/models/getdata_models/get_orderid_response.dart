import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orderid_response.g.dart';

@JsonSerializable()
class GetOrderIdResponse {
  final int? id;
  GetOrderIdResponse({
    this.id,
  });
  factory GetOrderIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrderIdResponseFromJson(json);
}