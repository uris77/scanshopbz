import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:scanshop_models/src/geo_location.dart';

part 'store.freezed.dart';
part 'store.g.dart';

/// Represents a Store
@freezed
class Store extends Entity with _$Store {
  /// constructs a store
  @JsonSerializable(explicitToJson: true)
  const factory Store(
      {required String id,
      required String name,
      GeoLocation? geoLocation,
      Address? address}) = _Store;

  /// Converts json to Store
  factory Store.fromJson(Map<String, dynamic> json) => _$_$_StoreFromJson(json);
}
