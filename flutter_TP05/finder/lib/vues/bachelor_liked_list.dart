import 'package:flutter/material.dart';

import '../models/bachelor.dart';
import 'bachelor_preview.dart';

class BachelorLikedList extends StatefulWidget {
  const BachelorLikedList({super.key, required this.likedBachelors});

  final List<Bachelor> likedBachelors;

  @override
  State<StatefulWidget> createState() => _BachelorLikedList();
}

class _BachelorLikedList extends State<BachelorLikedList> {
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
