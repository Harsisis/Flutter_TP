import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvProvider extends ChangeNotifier {
  late String _cityKey;
  late String _meteoKey;

  EnvProvider() {
    loadEnvironnement();
  }

  void loadEnvironnement() async {
    await dotenv.load(fileName: ".env");
    _cityKey = dotenv.env['CITY_API_KEY']!;
    _meteoKey = dotenv.env['METEO_API_KEY']!;
  }

  String get cityKey {
    return _cityKey;
  }

  String get meteoKey {
    return _meteoKey;
  }
}
