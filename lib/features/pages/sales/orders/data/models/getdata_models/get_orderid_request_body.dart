import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orderid_request_body.g.dart';

@JsonSerializable()
class GetOrderIdRequestBody {

  GetOrderIdRequestBody();

  Map<String, dynamic> toJson() => _$GetOrderIdRequestBodyToJson(this);
}