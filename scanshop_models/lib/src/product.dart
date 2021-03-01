import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/src/product_category.dart';

part 'product.g.dart';

/// Represents a Grocery Product
@JsonSerializable(nullable: true, explicitToJson: true)
class Product extends Entity implements Equatable {
  /// constructs a product
  Product(
      {@required this.id,
      @required this.name,
      this.description,
      this.tags,
      this.barcode,
      this.category,
      this.manufacturer});

  /// Unmarshalls from JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  /// Unique Id
  final String id;

  /// name of the product
  final String name;

  /// tags provide additional context and classification
  @JsonKey(defaultValue: [])
  final List<String> tags;

  /// the barcode of the item.
  /// if the product does not have a barcode, this value is an empty string.
  final String barcode;

  /// provides some comments that describe the product
  final String description;

  /// the category for the product.
  final ProductCategory category;

  /// the manufacturer
  final String manufacturer;

  /// Marshals a product to JSON
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}
