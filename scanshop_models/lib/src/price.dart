import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';

import '../models.dart';

part 'price.g.dart';

/// The price of an item at a store.
@JsonSerializable(explicitToJson: true)
class Price extends Entity implements Equatable {
  /// Constructor
  Price(
      {@required this.id,
      this.product,
      this.store,
      this.price,
      this.timestamp});

  /// converts a JSON object to Price
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  /// Copies a Price and modifies selected fields.
  Price copyWith(
      {@required String id, Product product, Store store, double price}) {
    return Price(
      id: id,
      timestamp: DateTime.now(),
      store: store ?? this.store,
      product: product ?? this.product,
      price: price ?? this.price,
    );
  }

  /// Automatically generated unique id;
  final String id;

  /// The product
  final Product product;

  /// The store
  final Store store;

  /// The price
  final double price;

  /// The timestamp when it was created.
  final DateTime timestamp;

  /// Converts price to JSON.
  Map<String, dynamic> toJson() => _$PriceToJson(this);

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}
