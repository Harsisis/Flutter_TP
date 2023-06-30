import 'package:finder/providers/bachelor_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bachelor_grid_preview.dart';
import 'bachelor_preview.dart';
import 'finder_header_title.dart';

class FinderLikedListScreen extends StatefulWidget {
  const FinderLikedListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FinderLikedListScreen();
}

class _FinderLikedListScreen extends State<FinderLikedListScreen> {
  bool _isGridMode = false;
  @override
  Widget build(BuildContext context) {
    BachelorListProvider bachelorListProvider =
        context.watch<BachelorListProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FinderHeaderTitle(),
        actions: <Widget>[
          if (_isGridMode)
            IconButton(
              icon: const Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  _isGridMode = false;
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  _isGridMode = true;
                });
              },
            ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'unlike all bachelors',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Unlike every liked bachelors')));
              bachelorListProvider.removeAllLiked();
            },
          ),
        ],
      ),
      body: Center(
        child: _isGridMode
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: bachelorListProvider.getLikedBachelors.length,
                itemBuilder: (BuildContext context, int index) {
                  return BachelorGridPreview(
                      bachelor: bachelorListProvider.getLikedBachelors[index]);
                })
            : ListView.builder(
                itemCount: bachelorListProvider.getLikedBachelors.length,
                itemBuilder: (BuildContext context, int index) {
                  return BachelorPreview(
                      bachelor: bachelorListProvider.getLikedBachelors[index]);
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
