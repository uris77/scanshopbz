// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
class _$PriceTearOff {
  const _$PriceTearOff();

  _Price call(
      {required String id,
      required Product product,
      required Store store,
      required double price,
      required DateTime timestamp}) {
    return _Price(
      id: id,
      product: product,
      store: store,
      price: price,
      timestamp: timestamp,
    );
  }

  Price fromJson(Map<String, Object> json) {
    return Price.fromJson(json);
  }
}

/// @nodoc
const $Price = _$PriceTearOff();

/// @nodoc
mixin _$Price {
  String get id => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  Store get store => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      Product product,
      Store store,
      double price,
      DateTime timestamp});

  $ProductCopyWith<$Res> get product;
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$PriceCopyWithImpl<$Res> implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  final Price _value;
  // ignore: unused_field
  final $Res Function(Price) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? store = freezed,
    Object? price = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      product: product == freezed ? _value.product : product as Product,
      store: store == freezed ? _value.store : store as Store,
      price: price == freezed ? _value.price : price as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }

  @override
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }

  @override
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value));
    });
  }
}

/// @nodoc
abstract class _$PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$PriceCopyWith(_Price value, $Res Function(_Price) then) =
      __$PriceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      Product product,
      Store store,
      double price,
      DateTime timestamp});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$PriceCopyWithImpl<$Res> extends _$PriceCopyWithImpl<$Res>
    implements _$PriceCopyWith<$Res> {
  __$PriceCopyWithImpl(_Price _value, $Res Function(_Price) _then)
      : super(_value, (v) => _then(v as _Price));

  @override
  _Price get _value => super._value as _Price;

  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? store = freezed,
    Object? price = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_Price(
      id: id == freezed ? _value.id : id as String,
      product: product == freezed ? _value.product : product as Product,
      store: store == freezed ? _value.store : store as Store,
      price: price == freezed ? _value.price : price as double,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Price implements _Price {
  const _$_Price(
      {required this.id,
      required this.product,
      required this.store,
      required this.price,
      required this.timestamp});

  factory _$_Price.fromJson(Map<String, dynamic> json) =>
      _$_$_PriceFromJson(json);

  @override
  final String id;
  @override
  final Product product;
  @override
  final Store store;
  @override
  final double price;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Price(id: $id, product: $product, store: $store, price: $price, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Price &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$PriceCopyWith<_Price> get copyWith =>
      __$PriceCopyWithImpl<_Price>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PriceToJson(this);
  }
}

abstract class _Price implements Price {
  const factory _Price(
      {required String id,
      required Product product,
      required Store store,
      required double price,
      required DateTime timestamp}) = _$_Price;

  factory _Price.fromJson(Map<String, dynamic> json) = _$_Price.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Product get product => throw _privateConstructorUsedError;
  @override
  Store get store => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PriceCopyWith<_Price> get copyWith => throw _privateConstructorUsedError;
}
