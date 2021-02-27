import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:scanshop_models/src/geo_location.dart';

part 'store.g.dart';

/// Represents a Store
@JsonSerializable(explicitToJson: true)
class Store extends Entity {
  /// constructs a store
  Store({this.id, this.name, this.geoLocation, this.address});

  /// Copies a store and only modify certain fields.
  Store copyWith({String name, GeoLocation geoLocation, Address address}) {
    return Store(
      id: id,
      name: name ?? this.name,
      geoLocation: geoLocation ?? this.geoLocation,
      address: address ?? this.address,
    );
  }

  /// converts a JSON object to Store
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  /// Automatically generated & unique id
  int id;

  /// name of the store
  final String name;

  /// the geolocation
  final GeoLocation geoLocation;

  /// the address
  final Address address;

  /// Converts a Store to JSON
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
