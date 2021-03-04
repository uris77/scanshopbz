// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String,
    name: json['name'] as String?,
    street: json['street'] as String?,
    locality: json['locality'] as String?,
    administrativeArea: json['administrativeArea'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'street': instance.street,
      'locality': instance.locality,
      'administrativeArea': instance.administrativeArea,
      'country': instance.country,
    };
