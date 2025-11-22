
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? user_id;
  final String? user_namee;
  final String? user_ful_name;
  final bool? admin;
  final String? Token;

  LoginResponse(
      {this.user_id,
      this.user_namee,
      this.user_ful_name,
      this.admin,
      this.Token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

