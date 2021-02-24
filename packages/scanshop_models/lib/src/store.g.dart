// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    name: json['name'] as String,
    geoLocation: json['geoLocation'] == null
        ? null
        : GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
  )..id = json['id'] as int;
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'geoLocation': instance.geoLocation,
    };
