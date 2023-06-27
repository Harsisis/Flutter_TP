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
        color: Colors.greenAccent,
        child: Center(child: Text(widget.counter.toString())));
  }
}
