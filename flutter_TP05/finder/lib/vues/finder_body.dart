import 'package:finder/structures/bachelor_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bachelor_preview.dart';

class FinderBody extends StatefulWidget {
  const FinderBody({super.key});

  @override
  State<StatefulWidget> createState() => _FinderBody();
}

class _FinderBody extends State<FinderBody> {
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
            itemCount: bachelorList.getBachelors.length,
            itemBuilder: (BuildContext context, int index) {
              return BachelorPreview(bachelor: bachelorList.getBachelors[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/liked'),
        tooltip: "go to liked bachelors page",
        child: const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
