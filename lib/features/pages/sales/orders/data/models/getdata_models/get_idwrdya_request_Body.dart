import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_idwrdya_request_Body.g.dart';

@JsonSerializable()
class GetIdWrdyaRequestBody {
  int? user_id;
  GetIdWrdyaRequestBody({required this.user_id});
  Map<String, dynamic> toJson() => _$GetIdWrdyaRequestBodyToJson(this);
}