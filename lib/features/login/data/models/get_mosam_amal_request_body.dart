import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_mosam_amal_request_body.g.dart';

@JsonSerializable()
class GetMosamAmalRequestBody {

  GetMosamAmalRequestBody();

  Map<String, dynamic> toJson() => _$GetMosamAmalRequestBodyToJson(this);
}
