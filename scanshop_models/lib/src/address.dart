import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scanshop_api/api.dart';

part 'address.freezed.dart';
part 'address.g.dart';

/// Address is a minimal representation of an address.
/// It only represents the Country, Street, Locality, Name and Admin Area.
/// There is no need for zipcode because it is not applicable to Belize.
@freezed
class Address extends Entity with _$Address {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory Address(
      {required String id,
      String? name,
      String? street,
      String? locality,
      required String administrativeArea,
      required String country}) = _Address;

  /// Convert json to Address
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);
}
