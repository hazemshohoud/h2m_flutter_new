import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_idwrdya_response.g.dart';

@JsonSerializable()
class GetIdWrdyaResponse {
  final int? id_wardya;
  GetIdWrdyaResponse({
    this.id_wardya,
  });
  factory GetIdWrdyaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIdWrdyaResponseFromJson(json);
}