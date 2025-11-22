import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_customers_request_body.g.dart';

@JsonSerializable()
class GetCustomersRequestBody {
  final String name;
  final int id_frea_shrka;
  final int quentomla;

  GetCustomersRequestBody(
      {required this.name, required this.id_frea_shrka, required this.quentomla});

  Map<String, dynamic> toJson() => _$GetCustomersRequestBodyToJson(this);
}
