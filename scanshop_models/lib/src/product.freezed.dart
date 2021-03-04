// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {required String id,
      required String name,
      String? description,
      List<String>? tags,
      String? barcode,
      required ProductCategory category,
      String? manufacturer}) {
    return _Product(
      id: id,
      name: name,
      description: description,
      tags: tags,
      barcode: barcode,
      category: category,
      manufacturer: manufacturer,
    );
  }

  Product fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  ProductCategory get category => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? description,
      List<String>? tags,
      String? barcode,
      ProductCategory category,
      String? manufacturer});

  $ProductCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? barcode = freezed,
    Object? category = freezed,
    Object? manufacturer = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String?,
      tags: tags == freezed ? _value.tags : tags as List<String>?,
      barcode: barcode == freezed ? _value.barcode : barcode as String?,
      category:
          category == freezed ? _value.category : category as ProductCategory,
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer as String?,
    ));
  }

  @override
  $ProductCategoryCopyWith<$Res> get category {
    return $ProductCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? description,
      List<String>? tags,
      String? barcode,
      ProductCategory category,
      String? manufacturer});

  @override
  $ProductCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? barcode = freezed,
    Object? category = freezed,
    Object? manufacturer = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String?,
      tags: tags == freezed ? _value.tags : tags as List<String>?,
      barcode: barcode == freezed ? _value.barcode : barcode as String?,
      category:
          category == freezed ? _value.category : category as ProductCategory,
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer as String?,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Product implements _Product {
  const _$_Product(
      {required this.id,
      required this.name,
      this.description,
      this.tags,
      this.barcode,
      required this.category,
      this.manufacturer});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final List<String>? tags;
  @override
  final String? barcode;
  @override
  final ProductCategory category;
  @override
  final String? manufacturer;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, tags: $tags, barcode: $barcode, category: $category, manufacturer: $manufacturer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.barcode, barcode) ||
                const DeepCollectionEquality()
                    .equals(other.barcode, barcode)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.manufacturer, manufacturer) ||
                const DeepCollectionEquality()
                    .equals(other.manufacturer, manufacturer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(barcode) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(manufacturer);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required String id,
      required String name,
      String? description,
      List<String>? tags,
      String? barcode,
      required ProductCategory category,
      String? manufacturer}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  List<String>? get tags => throw _privateConstructorUsedError;
  @override
  String? get barcode => throw _privateConstructorUsedError;
  @override
  ProductCategory get category => throw _privateConstructorUsedError;
  @override
  String? get manufacturer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
