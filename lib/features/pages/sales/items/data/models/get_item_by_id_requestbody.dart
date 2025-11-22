import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_item_by_id_requestbody.g.dart';

@JsonSerializable()
class GetItemByIdRequestBody {
   int id_montag,id_mkhzan,id_mosam;
   String AvergSerSHra;
  GetItemByIdRequestBody(
      {
        required this.id_montag,
        required this.id_mkhzan,
        required this.id_mosam,
        required this.AvergSerSHra
      });
  Map<String, dynamic> toJson() => _$GetItemByIdRequestBodyToJson(this);
}