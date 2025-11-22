import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_edda_request_body.g.dart';

@JsonSerializable()
class AddEddaRequestBody {
  final String date_hrka;
  final int id_edaa;
  final int id_mndob;
  final double sader;
  final int wared;
  final int id_order;
  final String twred;
  final String id_mkzan;
  final int id_mosam;
  final String byan;

  AddEddaRequestBody(
      {
        required this.date_hrka,
        required this.id_edaa,
        required this.id_mndob,
        required this.sader,
        required this.wared,
        required this.id_order,
        required this.twred,
        required this.id_mkzan,
        required this.id_mosam,
        required this.byan
      });
  Map<String, dynamic> toJson() => _$AddEddaRequestBodyToJson(this);
}