import '../enums/kind_enum.dart';

class SolarSystemElement {
  late final String name;
  late final KindEnum kind;

  SolarSystemElement(String name, KindEnum kind) {
    this.name = name;
    this.kind = kind;
  }
}
