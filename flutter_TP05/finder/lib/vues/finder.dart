import 'package:flutter/material.dart';

import '../data/data_giver.dart';

class Finder extends StatelessWidget {
  Finder({super.key});

  final DataGiver dataGiver = DataGiver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routerConfig: _router;
      title: "Finder",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: FinderBody(
        bachelors: dataGiver.bachelors,
      ),
    );
  }
}
