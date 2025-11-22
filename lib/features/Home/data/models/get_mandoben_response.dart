import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_mandoben_response.g.dart';

@JsonSerializable()
class GetMandobenResponse {
  int? IdMndob;
  String? NameMandob;
  GetMandobenResponse(
      this.IdMndob,
      this.NameMandob
      );

  factory GetMandobenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMandobenResponseFromJson(json);
}
