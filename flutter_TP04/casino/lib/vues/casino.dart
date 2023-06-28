import 'package:casino/vues/casino_body.dart';
import 'package:flutter/material.dart';

class Casino extends StatelessWidget {
  const Casino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Casino",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          background: const Color.fromARGB(115, 38, 38, 38),
        ),
        useMaterial3: true,
      ),
      home: const CasinoBody(),
    );
  }
}
