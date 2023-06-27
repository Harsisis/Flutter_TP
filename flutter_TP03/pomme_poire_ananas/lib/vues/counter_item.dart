import 'dart:math';

import 'package:flutter/material.dart';

class CounterItem extends StatefulWidget {
  const CounterItem({super.key, required this.counter});

  final int counter;

  @override
  State<StatefulWidget> createState() => _CounterItem();
}

class _CounterItem extends State<CounterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.counter % 2 == 1 ? Colors.green : Colors.amber,
        child: Center(
            child: Column(
          children: [
            Image.asset(
              getImageByCounter(),
              height: 200,
              width: 200,
            ),
            Text(
              widget.counter.toString(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        )));
  }

  String getImageByCounter() {
    if (isPremier()) {
      return "assets/images/ananas.png";
    }
    if (widget.counter % 2 == 0) {
      return "assets/images/poire.png";
    } else {
      return "assets/images/pomme.png";
    }
  }

  bool isPremier() {
    if (widget.counter <= 1) {
      return false;
    }
    for (int i = 2; i <= sqrt(widget.counter); i++) {
      if (widget.counter % i == 0) {
        return false;
      }
    }
    return true;
  }
}
