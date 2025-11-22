import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_stores_request_body.g.dart';

@JsonSerializable()
class GetStoresRequestBody {
  final int id_frea_shrka;
  GetStoresRequestBody(
      {required this.id_frea_shrka,});

  Map<String, dynamic> toJson() => _$GetStoresRequestBodyToJson(this);
}
