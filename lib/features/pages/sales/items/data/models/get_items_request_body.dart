import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_items_request_body.g.dart';

@JsonSerializable()
class GetItemsRequestBody {
  final String name_montag;
  final int id_mkhzan;
  final String AvergSerSHra;
  final int id_mosam;
  final int NumberOfPage;
  final int id_sanf_hiden;
  GetItemsRequestBody(
      {required this.name_montag,
      required this.id_mkhzan,
      required this.AvergSerSHra,
      required this.id_mosam,
      required this.NumberOfPage,
      required this.id_sanf_hiden});
  Map<String, dynamic> toJson() => _$GetItemsRequestBodyToJson(this);
}
