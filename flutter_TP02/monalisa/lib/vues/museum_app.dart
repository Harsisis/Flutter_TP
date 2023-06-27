import 'package:flutter/material.dart';

import 'artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        fontFamily: 'Merriweather',
      ),
      home: const Artwork(),
    );
  }
}
