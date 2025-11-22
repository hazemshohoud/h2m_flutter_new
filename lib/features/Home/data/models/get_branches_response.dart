import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_branches_response.g.dart';

@JsonSerializable()
class GetBranchesResponse {
  int? IdShrka;
  String? NameShrka;
  GetBranchesResponse(
      this.IdShrka,
      this.NameShrka
      );

  factory GetBranchesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBranchesResponseFromJson(json);
}
