import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_branches_request_body.g.dart';

@JsonSerializable()
class GetBranchesRequestBody {
  
  GetBranchesRequestBody();

  Map<String, dynamic> toJson() => _$GetBranchesRequestBodyToJson(this);
}
