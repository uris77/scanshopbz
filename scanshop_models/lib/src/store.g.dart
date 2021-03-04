// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    id: json['id'] as String,
    name: json['name'] as String,
    geoLocation: json['geoLocation'] == null
        ? null
        : GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'geoLocation': instance.geoLocation?.toJson(),
      'address': instance.address?.toJson(),
    };
