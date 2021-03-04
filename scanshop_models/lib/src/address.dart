import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';

part 'address.g.dart';

/// Address is a minimal representation of an address.
/// It only represents the Country, Street, Locality, Name and Admin Area.
/// There is no need for zipcode because it is not applicable to Belize.
@JsonSerializable()
class Address extends Entity implements Equatable {
  /// Constructor
  Address(
      {required this.id,
      required this.name,
      this.street,
      this.locality,
      this.administrativeArea,
      this.country});

  /// converts a JSON object ot an Address
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Copies an Address and modifies only select fields.
  Address copyWith(
      {required String id,
      required String name,
      String? street,
      String? locality,
      String? administrativeArea}) {
    return Address(
        id: id,
        name: name ?? this.name,
        locality: locality ?? this.locality,
        administrativeArea: administrativeArea ?? this.administrativeArea,
        country: country);
  }

  /// unique id
  final String? id;

  /// The name of the address.
  /// We should be using the geocoding package to retrieve this information
  /// from a pair of coordindates.
  final String? name;

  /// The name of the street.
  final String? street;

  /// The name of the locality. This can be the name of the town,
  /// city or village.
  final String? locality;

  /// The name of the administrative area. For Belize, this is the District.
  final String? administrativeArea;

  /// The name of the country. This is generally just Belize.
  final String? country;

  /// Converts an Address to JSON
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
