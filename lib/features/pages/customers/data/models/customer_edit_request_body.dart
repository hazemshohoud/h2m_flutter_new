import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_edit_request_body.g.dart';

@JsonSerializable()
class CustomerEditRequestBody {
  final int id_amel;
  final String first_name;
  final int mndonName;
  final String tel;
  final String email;
  final String NowAmel;
  final int id_frea_shrka;
  CustomerEditRequestBody(
      {required this.id_amel,
      required this.first_name,
      required this.mndonName,
      required this.tel,
      required this.email,
      required this.NowAmel,
      required this.id_frea_shrka});

  Map<String, dynamic> toJson() => _$CustomerEditRequestBodyToJson(this);
}
