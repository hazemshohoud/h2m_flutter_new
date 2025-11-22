import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_idsndok_response.g.dart';

@JsonSerializable()
class GetIdsndokResponse {
  final int? id;
  GetIdsndokResponse({
    this.id,
  });
  factory GetIdsndokResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIdsndokResponseFromJson(json);
}