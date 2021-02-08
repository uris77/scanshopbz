// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fruit _$FruitFromJson(Map<String, dynamic> json) {
  return Fruit(
    name: json['name'] as String,
    isSweet: json['isSweet'] as bool,
  )..id = json['id'] as int;
}

Map<String, dynamic> _$FruitToJson(Fruit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSweet': instance.isSweet,
    };
