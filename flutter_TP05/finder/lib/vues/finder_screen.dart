import 'package:finder/providers/bachelor_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import 'bachelor_preview.dart';

class FinderScreen extends StatefulWidget {
  const FinderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FinderScreen();
}

class _FinderScreen extends State<FinderScreen> {
  late BachelorListProvider bachelorListProvider;
  late List<Bachelor> filteredBachelorList;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  void _searchName(String name) {
    setState(() {
      bachelorListProvider.setFilteredBachelors(bachelorListProvider
          .getBachelors
          .where((bach) =>
              bach.firstname.toLowerCase().contains(name.toLowerCase()))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    bachelorListProvider = context.watch<BachelorListProvider>();
    filteredBachelorList = bachelorListProvider.getFilteredBachelors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Finder"), Icon(Icons.favorite_border_rounded)],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: _searchName,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Rechercher par nom'
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBachelorList.length,
              itemBuilder: (BuildContext context, int index) {
                return BachelorPreview(bachelor: filteredBachelorList[index]);
              },
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/liked'),
        tooltip: "go to liked bachelors page",
        child: const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
