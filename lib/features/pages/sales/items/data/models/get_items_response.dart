
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_items_response.g.dart';

@JsonSerializable()
class GetItemsResponse {
  int? idMontag;
  String? nameMontag;
  String? nameMghzan;
  int? elhadEladna;
  double? rasedMontag;
  String? serBeeMontag;
  String? wasfElsanf;
  String? barkode;
  String? not;
  String? baledelsnaa;
  String? hagmObwa;
  int? avargBrice;
  String? priceNsGomla;
  String? priceBeeGomla;
  int? kasmAmel;
  int? idMosam;
  int? nowKhdm;
  int? montagTsnee;
  int? idEdaa;
  GetItemsResponse( {
    this.idMontag,
    this.nameMontag,
    this.nameMghzan,
    this.elhadEladna,
    this.rasedMontag,
    this.serBeeMontag,
    this.wasfElsanf,
    this.barkode,
    this.not,
    this.baledelsnaa,
    this.hagmObwa,
    this.avargBrice,
    this.priceNsGomla,
    this.priceBeeGomla,
    this.kasmAmel,
    this.idMosam,
    this.nowKhdm,
    this.montagTsnee,
    this.idEdaa,
  });

  factory GetItemsResponse.fromJson(Map<String, dynamic> json) => _$GetItemsResponseFromJson(json);

}