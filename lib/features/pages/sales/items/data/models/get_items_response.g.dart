// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsResponse _$GetItemsResponseFromJson(Map<String, dynamic> json) =>
    GetItemsResponse(
      idMontag: (json['idMontag'] as num?)?.toInt(),
      nameMontag: json['nameMontag'] as String?,
      nameMghzan: json['nameMghzan'] as String?,
      elhadEladna: (json['elhadEladna'] as num?)?.toInt(),
      rasedMontag: (json['rasedMontag'] as num?)?.toDouble(),
      serBeeMontag: json['serBeeMontag'] as String?,
      wasfElsanf: json['wasfElsanf'] as String?,
      barkode: json['barkode'] as String?,
      not: json['not'] as String?,
      baledelsnaa: json['baledelsnaa'] as String?,
      hagmObwa: json['hagmObwa'] as String?,
      avargBrice: (json['avargBrice'] as num?)?.toInt(),
      priceNsGomla: json['priceNsGomla'] as String?,
      priceBeeGomla: json['priceBeeGomla'] as String?,
      kasmAmel: (json['kasmAmel'] as num?)?.toInt(),
      idMosam: (json['idMosam'] as num?)?.toInt(),
      nowKhdm: (json['nowKhdm'] as num?)?.toInt(),
      montagTsnee: (json['montagTsnee'] as num?)?.toInt(),
      idEdaa: (json['idEdaa'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetItemsResponseToJson(GetItemsResponse instance) =>
    <String, dynamic>{
      'idMontag': instance.idMontag,
      'nameMontag': instance.nameMontag,
      'nameMghzan': instance.nameMghzan,
      'elhadEladna': instance.elhadEladna,
      'rasedMontag': instance.rasedMontag,
      'serBeeMontag': instance.serBeeMontag,
      'wasfElsanf': instance.wasfElsanf,
      'barkode': instance.barkode,
      'not': instance.not,
      'baledelsnaa': instance.baledelsnaa,
      'hagmObwa': instance.hagmObwa,
      'avargBrice': instance.avargBrice,
      'priceNsGomla': instance.priceNsGomla,
      'priceBeeGomla': instance.priceBeeGomla,
      'kasmAmel': instance.kasmAmel,
      'idMosam': instance.idMosam,
      'nowKhdm': instance.nowKhdm,
      'montagTsnee': instance.montagTsnee,
      'idEdaa': instance.idEdaa,
    };
