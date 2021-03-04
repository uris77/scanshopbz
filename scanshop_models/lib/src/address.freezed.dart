// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {required String id,
      String? name,
      String? street,
      String? locality,
      required String administrativeArea,
      required String country}) {
    return _Address(
      id: id,
      name: name,
      street: street,
      locality: locality,
      administrativeArea: administrativeArea,
      country: country,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get locality => throw _privateConstructorUsedError;
  String get administrativeArea => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? name,
      String? street,
      String? locality,
      String administrativeArea,
      String country});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? street = freezed,
    Object? locality = freezed,
    Object? administrativeArea = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String?,
      street: street == freezed ? _value.street : street as String?,
      locality: locality == freezed ? _value.locality : locality as String?,
      administrativeArea: administrativeArea == freezed
          ? _value.administrativeArea
          : administrativeArea as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? name,
      String? street,
      String? locality,
      String administrativeArea,
      String country});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? street = freezed,
    Object? locality = freezed,
    Object? administrativeArea = freezed,
    Object? country = freezed,
  }) {
    return _then(_Address(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String?,
      street: street == freezed ? _value.street : street as String?,
      locality: locality == freezed ? _value.locality : locality as String?,
      administrativeArea: administrativeArea == freezed
          ? _value.administrativeArea
          : administrativeArea as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Address implements _Address {
  const _$_Address(
      {required this.id,
      this.name,
      this.street,
      this.locality,
      required this.administrativeArea,
      required this.country});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? street;
  @override
  final String? locality;
  @override
  final String administrativeArea;
  @override
  final String country;

  @override
  String toString() {
    return 'Address(id: $id, name: $name, street: $street, locality: $locality, administrativeArea: $administrativeArea, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.locality, locality) ||
                const DeepCollectionEquality()
                    .equals(other.locality, locality)) &&
            (identical(other.administrativeArea, administrativeArea) ||
                const DeepCollectionEquality()
                    .equals(other.administrativeArea, administrativeArea)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(locality) ^
      const DeepCollectionEquality().hash(administrativeArea) ^
      const DeepCollectionEquality().hash(country);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {required String id,
      String? name,
      String? street,
      String? locality,
      required String administrativeArea,
      required String country}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get street => throw _privateConstructorUsedError;
  @override
  String? get locality => throw _privateConstructorUsedError;
  @override
  String get administrativeArea => throw _privateConstructorUsedError;
  @override
  String get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
