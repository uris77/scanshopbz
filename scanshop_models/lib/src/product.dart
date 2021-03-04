import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/src/product_category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Represents a Grocery Product
@freezed
class Product extends Entity with _$Product {
  /// constructs a product
  @JsonSerializable(explicitToJson: true)
  const factory Product(
      {required String id,
      required String name,
      String? description,
      List<String>? tags,
      String? barcode,
      required ProductCategory category,
      String? manufacturer}) = _Product;

  /// Converts json to Product
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);
}
