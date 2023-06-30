import 'package:finder/enums/gender_enum.dart';
import 'package:finder/providers/bachelor_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import 'bachelor_preview.dart';
import 'finder_header_title.dart';

class FinderScreen extends StatefulWidget {
  const FinderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FinderScreen();
}

class _FinderScreen extends State<FinderScreen> {
  late BachelorListProvider bachelorListProvider;
  late List<Bachelor> filteredBachelorList;
  late TextEditingController _controller;
  late GenderEnum _gender;
  late String _name;

  @override
  void initState() {
    _controller = TextEditingController();
    _gender = GenderEnum.all;
    _name = "";
    super.initState();
  }

  void _searchName(String name) {
    setState(() {
      _name = name;
      bachelorListProvider.setFilteredBachelors(
          bachelorListProvider.getFilteredBachlorList(_gender, _name));
    });
  }

  void _filterGender(GenderEnum? value) {
    setState(() {
      _gender = value!;
      bachelorListProvider.setFilteredBachelors(
          bachelorListProvider.getFilteredBachlorList(_gender, _name));
    });
  }

  @override
  Widget build(BuildContext context) {
    bachelorListProvider = context.watch<BachelorListProvider>();
    filteredBachelorList = bachelorListProvider.getFilteredBachelors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FinderHeaderTitle(),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        title: Text(GenderEnum.all.gender),
                        leading: Radio<GenderEnum>(
                          value: GenderEnum.all,
                          groupValue: _gender,
                          onChanged: _filterGender,
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        title: Text(GenderEnum.male.gender),
                        leading: Radio<GenderEnum>(
                          value: GenderEnum.male,
                          groupValue: _gender,
                          onChanged: _filterGender,
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        title: Text(GenderEnum.female.gender),
                        leading: Radio<GenderEnum>(
                          value: GenderEnum.female,
                          groupValue: _gender,
                          onChanged: _filterGender,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: _controller,
                    onChanged: _searchName,
                    decoration:
                        const InputDecoration(hintText: 'Search a bachelor'),
                  ),
                ),
              ],
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: const FinderHeaderTitle(),
            ),
            ListTile(
              title: const Text('See Liked Bachelors'),
              onTap: () {
                context.go('/liked');
              },
            ),
          ],
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
