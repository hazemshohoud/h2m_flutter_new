import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_idsndok_request_body.g.dart';

@JsonSerializable()
class GetIdsndokRequestBody {
  String? tarekh_elward;
  String wask_amlia;
  String mplagh_sandok;
  String khazna;
  GetIdsndokRequestBody({required this.tarekh_elward,
    required this.wask_amlia,
    required this.mplagh_sandok,
    required this.khazna,
  });
  Map<String, dynamic> toJson() => _$GetIdsndokRequestBodyToJson(this);
}