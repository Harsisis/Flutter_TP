import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

import 'bachelor_liked_list.dart';
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Finder"), Icon(Icons.favorite_border_rounded)],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BachelorLikedList(likedBachelors: likedBachelors)),
          );
        },
        tooltip: "go to liked bachelors page",
        child: const Icon(Icons.favorite_border_rounded),
      ),
    );
  }
}
