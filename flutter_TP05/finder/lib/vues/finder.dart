import 'package:flutter/material.dart';

import '../data/data_giver.dart';
import 'finder_body.dart';

class Finder extends StatelessWidget {
  Finder({super.key});

  final DataGiver dataGiver = DataGiver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
