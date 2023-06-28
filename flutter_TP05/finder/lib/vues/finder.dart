import 'package:finder/models/liked_bachelor_list.dart';
import 'package:finder/vues/finder_liked_list_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/data_giver.dart';
import '../main.dart';
import '../models/bachelor.dart';
import '../models/bachelor_list.dart';
import 'finder_body.dart';

class Finder extends StatelessWidget {
  Finder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => BachelorList(DataGiver().bachelors)),
          ChangeNotifierProxyProvider<Bachelor, LikedBachelorList>(
            create: (context) => LikedBachelorList(),
            update: (context, bachelor, likedBachelorsList) {
              if (bachelor == null) throw ArgumentError.notNull('bachelor');
              likedBachelorsList.add(bachelor);
              return likedBachelorsList;
            },
          ),
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
        ));
  }
}
