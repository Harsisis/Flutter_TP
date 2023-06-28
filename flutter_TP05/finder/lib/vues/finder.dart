import 'package:flutter/material.dart';

import 'finder_body.dart';

class Finder extends StatelessWidget {
  const Finder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finder",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          background: const Color.fromARGB(115, 38, 38, 38),
        ),
        useMaterial3: true,
      ),
      home: const FinderBody(),
    );
  }
}
