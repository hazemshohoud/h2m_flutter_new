
import 'package:freezed_annotation/freezed_annotation.dart';

part 'harket_makhzen_response_body.g.dart';

@JsonSerializable()
class HarketMakhzenResponseBody {
  final int idMontag;
  final String nameMontag;
  final double quntetyMpeat;
  final double rased;
  HarketMakhzenResponseBody({
    required this.idMontag,
    required this.nameMontag,
    required this.quntetyMpeat,
    required this.rased
  });

  factory HarketMakhzenResponseBody.fromJson(Map<String, dynamic> json) => _$HarketMakhzenResponseBodyFromJson(json);
}