import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

import 'bachelor_preview.dart';

class FinderBody extends StatefulWidget {
  const FinderBody({super.key, required this.bachelors});

  final List<Bachelor> bachelors;

  @override
  State<StatefulWidget> createState() => _FinderBody();
}

class _FinderBody extends State<FinderBody> {
  List<Bachelor> likedBachelors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Finder ❤️"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: widget.bachelors.length,
            itemBuilder: (BuildContext context, int index) {
              return BachelorPreview(
                  bachelor: widget.bachelors[index],
                  likedBachelors: likedBachelors);
            }),
      ),
    );
  }
}
