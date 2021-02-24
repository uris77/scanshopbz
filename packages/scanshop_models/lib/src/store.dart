import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/src/geo_location.dart';

part 'store.g.dart';

/// Represents a Store
@JsonSerializable()
class Store extends Entity {
  /// constructs a store
  Store({this.name, this.geoLocation});

  /// converts a JSON object to Store
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  /// Automatically generated & unique id
  int id;

  /// name of the store
  final String name;

  /// the geolocation
  final GeoLocation geoLocation;

  /// Converts a Store to JSON
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
