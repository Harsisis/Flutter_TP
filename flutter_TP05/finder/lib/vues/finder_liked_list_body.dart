import 'package:flutter/material.dart';

import '../models/bachelor.dart';
import 'bachelor_preview.dart';

class FinderLikedListBody extends StatefulWidget {
  const FinderLikedListBody({super.key});

  final List<Bachelor> likedBachelors;

  @override
  State<StatefulWidget> createState() => _FinderLikedListBody();
}

class _FinderLikedListBody extends State<FinderLikedListBody> {
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
            itemCount: widget.likedBachelors.length,
            itemBuilder: (BuildContext context, int index) {
              return BachelorPreview(
                  bachelor: widget.likedBachelors[index],
                  likedBachelors: widget.likedBachelors);
            }),
      ),
    );
  }
}
