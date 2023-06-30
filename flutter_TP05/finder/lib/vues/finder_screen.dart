import 'package:finder/enums/gender_enum.dart';
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
  late GenderEnum _gender;

  @override
  void initState() {
    _controller = TextEditingController();
    _gender = GenderEnum.all;
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

  void _sortGender(GenderEnum? value) {
    setState(() {
      _gender = value!;
      bachelorListProvider.setFilteredBachelors(bachelorListProvider
          .getBachelors
          .where((bach) => bach.gender == value || value == GenderEnum.all)
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
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(GenderEnum.all.gender),
                  leading: Radio<GenderEnum>(
                    value: GenderEnum.all,
                    groupValue: _gender,
                    onChanged: _sortGender,
                  ),
                ),
                ListTile(
                  title: Text(GenderEnum.male.gender),
                  leading: Radio<GenderEnum>(
                    value: GenderEnum.male,
                    groupValue: _gender,
                    onChanged: _sortGender,
                  ),
                ),
                ListTile(
                  title: Text(GenderEnum.female.gender),
                  leading: Radio<GenderEnum>(
                    value: GenderEnum.female,
                    groupValue: _gender,
                    onChanged: _sortGender,
                  ),
                ),
                TextField(
                  controller: _controller,
                  onChanged: _searchName,
                  decoration:
                      const InputDecoration(hintText: 'Search a bachelor'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/liked'),
        tooltip: "go to liked bachelors page",
        child: const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
