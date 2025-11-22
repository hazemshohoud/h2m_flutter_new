import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_mandoben_request_body.g.dart';

@JsonSerializable()
class GetMandobenRequestBody {
  final int id_frea_shrka;
  GetMandobenRequestBody(
      {required this.id_frea_shrka,});

  Map<String, dynamic> toJson() => _$GetMandobenRequestBodyToJson(this);
}
