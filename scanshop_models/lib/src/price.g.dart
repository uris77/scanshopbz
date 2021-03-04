// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$_$_PriceFromJson(Map<String, dynamic> json) {
  return _$_Price(
    id: json['id'] as String,
    product: Product.fromJson(json['product'] as Map<String, dynamic>),
    store: Store.fromJson(json['store'] as Map<String, dynamic>),
    price: (json['price'] as num).toDouble(),
    timestamp: DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'store': instance.store.toJson(),
      'price': instance.price,
      'timestamp': instance.timestamp.toIso8601String(),
    };
