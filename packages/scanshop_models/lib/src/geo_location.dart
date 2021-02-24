import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';

part 'geo_location.g.dart';

/// Represents a GeoLocation
@JsonSerializable()
class GeoLocation extends Entity {
  /// Constructs a GeoLocation
  GeoLocation({this.lat, this.lon});

  /// The latitude
  final double lat;

  /// The longitude
  final double lon;
}
