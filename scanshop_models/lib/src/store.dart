import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:scanshop_models/src/geo_location.dart';

part 'store.g.dart';

/// Represents a Store
@JsonSerializable(explicitToJson: true)
class Store extends Entity implements Equatable {
  /// constructs a store
  Store(
      {required this.id, required this.name, this.geoLocation, this.address});

  /// converts a JSON object to Store
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  /// Copies a store and only modify certain fields.
  Store copyWith(
      {required String id,
      String? name,
      GeoLocation? geoLocation,
      Address? address}) {
    return Store(
      id: id,
      name: name ?? this.name,
      geoLocation: geoLocation ?? this.geoLocation,
      address: address ?? this.address,
    );
  }

  /// Automatically generated & unique id
  final String? id;

  /// name of the store
  final String? name;

  /// the geolocation
  final GeoLocation? geoLocation;

  /// the address
  final Address? address;

  /// Converts a Store to JSON
  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;
}
