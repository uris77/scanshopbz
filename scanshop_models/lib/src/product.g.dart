// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    barcode: json['barcode'] as String?,
    category:
        ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
    manufacturer: json['manufacturer'] as String?,
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
      'barcode': instance.barcode,
      'category': instance.category.toJson(),
      'manufacturer': instance.manufacturer,
    };
