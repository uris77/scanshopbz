// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    id: json['id'] as int,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    store: json['store'] == null
        ? null
        : Store.fromJson(json['store'] as Map<String, dynamic>),
    price: (json['price'] as num)?.toDouble(),
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product?.toJson(),
      'store': instance.store?.toJson(),
      'price': instance.price,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
