
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edda_response.g.dart';

@JsonSerializable()
class AddEddaResponse {
  int? id_ordar;
  AddEddaResponse( {
    this.id_ordar,
  });

  factory AddEddaResponse.fromJson(Map<String, dynamic> json) => _$AddEddaResponseFromJson(json);

}