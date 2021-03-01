import 'package:uuid/uuid.dart';

/// Generates unique ids.
class IdGenerator {
  /// Constructor
  IdGenerator() {
    uuid = Uuid();
  }

  /// the uuid generator
  Uuid uuid;

  /// a unique id
  String get id => uuid.v1();
}
