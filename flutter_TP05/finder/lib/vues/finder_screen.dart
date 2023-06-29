import 'package:finder/providers/bachelor_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bachelor_preview.dart';

class FinderScreen extends StatefulWidget {
  const FinderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FinderScreen();
}

class _FinderScreen extends State<FinderScreen> {
  @override
  Widget build(BuildContext context) {
    BachelorListProvider bachelorList = context.watch<BachelorListProvider>();

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
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/liked'),
        tooltip: "go to liked bachelors page",
        child: const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
