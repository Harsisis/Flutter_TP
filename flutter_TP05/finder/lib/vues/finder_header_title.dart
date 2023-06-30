import 'package:flutter/material.dart';

class FinderHeaderTitle extends StatelessWidget {
  const FinderHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Finder"), Icon(Icons.favorite_border_rounded)],
    );
  }
}
