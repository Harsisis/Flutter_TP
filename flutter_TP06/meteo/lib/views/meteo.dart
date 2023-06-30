import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/env_provider.dart';
import 'meteo_screen.dart';

class Meteo extends StatelessWidget {
  const Meteo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => EnvProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Finder",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              background: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: const MeteoScreen(),
        ));
  }
}
