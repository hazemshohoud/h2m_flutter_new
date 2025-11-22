import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_harket_amel_response.g.dart';

@JsonSerializable()
class GetHarketAmelResponse {
  final int? id;
  GetHarketAmelResponse({this.id});

  factory GetHarketAmelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHarketAmelResponseFromJson(json);
}