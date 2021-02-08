import 'package:json_annotation/json_annotation.dart';
import 'package:scanshop_api/api.dart';

part 'fruit.g.dart';

/// Represents a fruit
@JsonSerializable(nullable: false)
class Fruit extends Entity{
  /// Automatically generated & unique id
  int id;

  /// name of the fruit
  final String name;
  /// indicates sweetness
  final bool isSweet;

  /// constructs a fruit
  // ignore: sort_constructors_first
  Fruit({this.name, this.isSweet});



  /// Unmarshalls from JSON to Fruit
  // ignore: sort_constructors_first
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return _$FruitFromJson(json);
  }

  /// Marshalls a fruit to JSON
  Map<String, dynamic> toJson() => _$FruitToJson(this);
}
