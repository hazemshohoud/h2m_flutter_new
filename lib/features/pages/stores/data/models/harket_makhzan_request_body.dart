import 'package:freezed_annotation/freezed_annotation.dart';

part 'harket_makhzan_request_body.g.dart';

@JsonSerializable()
class HarketMakhzanRequestBody {
    final int id_mkzan;
    final int id_frea_shrka;
    final String date1;
    final String date2;
    final int id_mosam;
  HarketMakhzanRequestBody({
    required this.id_mkzan,
    required this.id_frea_shrka,
    required this.date1,
    required this.date2,
    required this.id_mosam
    });
  Map<String, dynamic> toJson() => _$HarketMakhzanRequestBodyToJson(this);
}
