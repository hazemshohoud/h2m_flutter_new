import 'package:freezed_annotation/freezed_annotation.dart';
part 'representative_request_body.g.dart';

@JsonSerializable()
class RepresentativeRequestBody {
  final int user_id;

  RepresentativeRequestBody({required this.user_id});

  Map<String, dynamic> toJson() => _$RepresentativeRequestBodyToJson(this);

}
