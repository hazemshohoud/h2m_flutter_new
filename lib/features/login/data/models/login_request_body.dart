import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String user_namee;
  final String passwordText;

  LoginRequestBody({required this.user_namee, required this.passwordText});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
