// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemByIdResponse _$GetItemByIdResponseFromJson(Map<String, dynamic> json) =>
    GetItemByIdResponse(
      Id_Montag: (json['Id_Montag'] as num?)?.toInt(),
      NameMontag: json['NameMontag'] as String?,
      NameMghzan: json['NameMghzan'] as String?,
      ElhadEladna: (json['ElhadEladna'] as num?)?.toDouble(),
      RasedMontag: (json['RasedMontag'] as num?)?.toDouble(),
      SerBeeMontag: json['SerBeeMontag'] as String?,
      WasfElsanf: json['WasfElsanf'] as String?,
      Barkode: json['Barkode'] as String?,
      Not: json['Not'] as String?,
      Baledelsnaa: json['Baledelsnaa'] as String?,
      HagmObwa: json['HagmObwa'] as String?,
      AvargBrice: (json['AvargBrice'] as num?)?.toDouble(),
      Price_Ns_Gomla: json['Price_Ns_Gomla'] as String?,
      Price_Bee_Gomla: json['Price_Bee_Gomla'] as String?,
      KasmAmel: (json['KasmAmel'] as num?)?.toDouble(),
      id_mosam: (json['id_mosam'] as num?)?.toInt(),
      NowKhdm: (json['NowKhdm'] as num?)?.toInt(),
      MontagTsnee: (json['MontagTsnee'] as num?)?.toInt(),
      IdEdaa: (json['IdEdaa'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetItemByIdResponseToJson(
        GetItemByIdResponse instance) =>
    <String, dynamic>{
      'Id_Montag': instance.Id_Montag,
      'NameMontag': instance.NameMontag,
      'NameMghzan': instance.NameMghzan,
      'ElhadEladna': instance.ElhadEladna,
      'RasedMontag': instance.RasedMontag,
      'SerBeeMontag': instance.SerBeeMontag,
      'WasfElsanf': instance.WasfElsanf,
      'Barkode': instance.Barkode,
      'Not': instance.Not,
      'Baledelsnaa': instance.Baledelsnaa,
      'HagmObwa': instance.HagmObwa,
      'AvargBrice': instance.AvargBrice,
      'Price_Ns_Gomla': instance.Price_Ns_Gomla,
      'Price_Bee_Gomla': instance.Price_Bee_Gomla,
      'KasmAmel': instance.KasmAmel,
      'id_mosam': instance.id_mosam,
      'NowKhdm': instance.NowKhdm,
      'MontagTsnee': instance.MontagTsnee,
      'IdEdaa': instance.IdEdaa,
    };
