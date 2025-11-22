
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_mosam_amal_response.g.dart';

@JsonSerializable()
class GetMosamAmalResponse {
  final String? mosam_id;
  final String? mosam_name;

  GetMosamAmalResponse(
      {this.mosam_id,
      this.mosam_name,
});

  factory GetMosamAmalResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMosamAmalResponseFromJson(json);
}

