// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    tags: (json['tags'] as List?)?.map((e) => e as String)?.toList() ?? [],
    barcode: json['barcode'] as String?,
    category: json['category'] == null
        ? null
        : ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
    manufacturer: json['manufacturer'] as String?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tags': instance.tags,
      'barcode': instance.barcode,
      'description': instance.description,
      'category': instance.category?.toJson(),
      'manufacturer': instance.manufacturer,
    };
