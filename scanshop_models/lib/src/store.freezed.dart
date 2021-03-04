// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
class _$StoreTearOff {
  const _$StoreTearOff();

  _Store call(
      {required String id,
      required String name,
      GeoLocation? geoLocation,
      Address? address}) {
    return _Store(
      id: id,
      name: name,
      geoLocation: geoLocation,
      address: address,
    );
  }

  Store fromJson(Map<String, Object> json) {
    return Store.fromJson(json);
  }
}

/// @nodoc
const $Store = _$StoreTearOff();

/// @nodoc
mixin _$Store {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  GeoLocation? get geoLocation => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, GeoLocation? geoLocation, Address? address});

  $GeoLocationCopyWith<$Res>? get geoLocation;
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? geoLocation = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      geoLocation: geoLocation == freezed
          ? _value.geoLocation
          : geoLocation as GeoLocation?,
      address: address == freezed ? _value.address : address as Address?,
    ));
  }

  @override
  $GeoLocationCopyWith<$Res>? get geoLocation {
    if (_value.geoLocation == null) {
      return null;
    }

    return $GeoLocationCopyWith<$Res>(_value.geoLocation!, (value) {
      return _then(_value.copyWith(geoLocation: value));
    });
  }

  @override
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, GeoLocation? geoLocation, Address? address});

  @override
  $GeoLocationCopyWith<$Res>? get geoLocation;
  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? geoLocation = freezed,
    Object? address = freezed,
  }) {
    return _then(_Store(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      geoLocation: geoLocation == freezed
          ? _value.geoLocation
          : geoLocation as GeoLocation?,
      address: address == freezed ? _value.address : address as Address?,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Store implements _Store {
  const _$_Store(
      {required this.id, required this.name, this.geoLocation, this.address});

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final GeoLocation? geoLocation;
  @override
  final Address? address;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, geoLocation: $geoLocation, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.geoLocation, geoLocation) ||
                const DeepCollectionEquality()
                    .equals(other.geoLocation, geoLocation)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(geoLocation) ^
      const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreToJson(this);
  }
}

abstract class _Store implements Store {
  const factory _Store(
      {required String id,
      required String name,
      GeoLocation? geoLocation,
      Address? address}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  GeoLocation? get geoLocation => throw _privateConstructorUsedError;
  @override
  Address? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreCopyWith<_Store> get copyWith => throw _privateConstructorUsedError;
}
