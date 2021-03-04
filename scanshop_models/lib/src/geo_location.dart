import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';

part 'geo_location.g.dart';

/// Represents a GeoLocation
@JsonSerializable()
class GeoLocation extends Entity implements Equatable {
  /// Constructs a GeoLocation
  GeoLocation({this.lat, this.lon});

  /// Creates a GeoLocation from a json object.
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);

  /// The latitude
  final double? lat;

  /// The longitude
  final double? lon;

  /// Converts a GeoLocation to JSON
  Map<String, dynamic> toJson() => _$GeoLocationToJson(this);

  @override
  List<Object?> get props => [lat, lon];

  @override
  bool get stringify => true;
}
