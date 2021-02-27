import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';

import '../models.dart';

part 'price.g.dart';

/// The price of an item at a store.
@JsonSerializable(explicitToJson: true)
class Price extends Entity {
  /// Constructor
  Price({this.id, this.product, this.store, this.price, this.timestamp});

  /// converts a JSON object to Price
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  /// Copies a Price and modifies selected fields.
  Price copyWith({Product product, Store store, double price}) {
    return Price(
      id: id,
      timestamp: DateTime.now(),
      store: store ?? this.store,
      product: product ?? this.product,
      price: price ?? this.price,
    );
  }

  /// Automatically generated unique id;
  int id;

  /// The product
  final Product product;

  /// The store
  final Store store;

  /// The price
  final double price;

  /// The timestamp when it was created.
  final DateTime timestamp;

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
