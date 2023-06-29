import 'package:finder/structures/bachelor_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bachelor_preview.dart';

class FinderLikedListBody extends StatefulWidget {
  const FinderLikedListBody({super.key});

  @override
  State<StatefulWidget> createState() => _FinderLikedListBody();
}

class _FinderLikedListBody extends State<FinderLikedListBody> {
  @override
  Widget build(BuildContext context) {
    BachelorList bachelorList = context.watch<BachelorList>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Finder"), Icon(Icons.favorite_border_rounded)],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: bachelorList.getLikedBachelors.length,
            itemBuilder: (BuildContext context, int index) {
              return BachelorPreview(
                  bachelor: bachelorList.getLikedBachelors[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        tooltip: "go back to the Home page",
        child: const Icon(Icons.house_rounded),
      ),
    );
  }
}
