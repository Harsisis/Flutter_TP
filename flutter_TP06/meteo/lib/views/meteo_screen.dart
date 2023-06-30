import 'package:flutter/material.dart';
import 'package:meteo/services/city_service.dart';
import 'package:meteo/services/meteo_service.dart';
import 'package:provider/provider.dart';

import '../providers/env_provider.dart';

class MeteoScreen extends StatefulWidget {
  const MeteoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MeteoScreen();
}

class _MeteoScreen extends State<MeteoScreen> {
  late TextEditingController _controller;

  late EnvProvider _envProvider;

  late MeteoService _meteoService;
  late CityService _cityService;
  late String _cityName;
  @override
  void initState() async {
    _controller = TextEditingController();
    _cityService = CityService(_envProvider.cityKey, _cityName);
    super.initState();
  }

  void _searchName(String name) {
    setState(() {
      _cityName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    _envProvider = context.watch<EnvProvider>();
    return Center(
      child: Column(children: [
        const Text("Météo"),
        TextField(
          controller: _controller,
          onChanged: _searchName,
          decoration: const InputDecoration(hintText: 'Search a bachelor'),
        ),
      ]),
    );
  }
}
