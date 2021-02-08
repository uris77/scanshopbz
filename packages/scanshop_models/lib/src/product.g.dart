// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    name: json['name'] as String,
    description: json['description'] as String,
    tags: (json['tags'] as List).map((e) => e as String).toList(),
    barcode: json['barcode'] as String,
    category: _$enumDecode(_$ProductCategoryEnumMap, json['category']),
  )..id = json['id'] as int;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tags': instance.tags,
      'barcode': instance.barcode,
      'description': instance.description,
      'category': _$ProductCategoryEnumMap[instance.category],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$ProductCategoryEnumMap = {
  ProductCategory.beverages: 'beverages',
  ProductCategory.bakingSupplies: 'bakingSupplies',
  ProductCategory.breadBakery: 'breadBakery',
  ProductCategory.condimentsSauces: 'condimentsSauces',
  ProductCategory.dairy: 'dairy',
  ProductCategory.dessertsSweets: 'dessertsSweets',
  ProductCategory.dryGoods: 'dryGoods',
  ProductCategory.fruitVegetables: 'fruitVegetables',
  ProductCategory.meatsSeafoods: 'meatsSeafoods',
  ProductCategory.preparedFoods: 'preparedFoods',
  ProductCategory.cleaners: 'cleaners',
  ProductCategory.paperGoods: 'paperGoods',
  ProductCategory.personalCare: 'personalCare',
  ProductCategory.petItems: 'petItems',
};
