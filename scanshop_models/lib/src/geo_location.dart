import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scanshop_api/api.dart';

part 'geo_location.freezed.dart';
part 'geo_location.g.dart';

/// Represents a GeoLocation
@freezed
class GeoLocation extends Entity with _$GeoLocation {
  /// Constructs a GeoLocation
  @JsonSerializable(explicitToJson: true)
  const factory GeoLocation({required double lat, required double lon}) =
      _GeoLocation;

  /// Converts to GeoLocation from Json
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
