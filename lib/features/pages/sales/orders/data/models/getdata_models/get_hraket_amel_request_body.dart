import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_hraket_amel_request_body.g.dart';

@JsonSerializable()
class GetHraketAmelRequestBody {
  GetHraketAmelRequestBody();
  Map<String, dynamic> toJson() => _$GetHraketAmelRequestBodyToJson(this);
}