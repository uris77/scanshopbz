import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scanshop_api/api.dart';

import '../models.dart';

part 'price.freezed.dart';
part 'price.g.dart';

/// The price of an item at a store.
@freezed
class Price extends Entity with _$Price {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory Price(
      {required String id,
      required Product product,
      required Store store,
      required double price,
      required DateTime timestamp}) = _Price;

  /// converts json to Price
  factory Price.fromJson(Map<String, dynamic> json) => _$_$_PriceFromJson(json);
}
