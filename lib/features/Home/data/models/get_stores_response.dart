import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stores_response.g.dart';

@JsonSerializable()
class GetBranchesResponse {
  int? Idmakhzan;
  String? NameMakjzan;
  GetBranchesResponse(
      this.Idmakhzan,
      this.NameMakjzan
      );

  factory GetBranchesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBranchesResponseFromJson(json);
}
