import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:finder/providers/bachelor_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_giver.dart';
import '../main.dart';

class Finder extends StatelessWidget {
  const Finder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => BachelorListProvider(DataGiver().bachelors)),
        ],
        child: AdaptiveTheme(
          light: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber,
              background: Colors.white,
            ),
            useMaterial3: true,
          ),
          dark: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrangeAccent,
              background: Colors.black,
            ),
            useMaterial3: true,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Finder",
            theme: theme,
            darkTheme: darkTheme,
            routerConfig: router(),
          ),
        ));
  }
}
