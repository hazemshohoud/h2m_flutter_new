
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_item_by_id_response.g.dart';

@JsonSerializable()
class GetItemByIdResponse {
     int? Id_Montag;
     String? NameMontag;
     String? NameMghzan;
     double? ElhadEladna;
     double? RasedMontag;
     String? SerBeeMontag;
     String? WasfElsanf;
     String? Barkode;
     String? Not;
     String? Baledelsnaa;
     String? HagmObwa;
     double? AvargBrice;
     String? Price_Ns_Gomla;
     String? Price_Bee_Gomla;
     double? KasmAmel;
     int? id_mosam;
     int? NowKhdm;
     int? MontagTsnee;
     int? IdEdaa;
  GetItemByIdResponse( {
    this.Id_Montag,
    this.NameMontag,
    this.NameMghzan,    
    this.ElhadEladna,
    this.RasedMontag,
    this.SerBeeMontag,
    this.WasfElsanf,
    this.Barkode,
    this.Not,
    this.Baledelsnaa,
    this.HagmObwa,
    this.AvargBrice,
    this.Price_Ns_Gomla,
    this.Price_Bee_Gomla,
    this.KasmAmel,
    this.id_mosam,
    this.NowKhdm,
    this.MontagTsnee,
    this.IdEdaa
  });

  factory GetItemByIdResponse.fromJson(Map<String, dynamic> json) => _$GetItemByIdResponseFromJson(json);

}