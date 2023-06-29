import 'package:finder/structures/bachelor_list.dart';
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
            create: (context) => BachelorList(DataGiver().bachelors)),
      ],
      child: MaterialApp.router(
        title: "Finder",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            background: Colors.white,
          ),
          useMaterial3: true,
        ),
        routerConfig: router(),
      ),
    );
  }
}
