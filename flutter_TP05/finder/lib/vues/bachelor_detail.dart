import 'package:flutter/material.dart';

import '../models/bachelor.dart';

class BachelorDetail extends StatefulWidget {
  const BachelorDetail({super.key, required this.bachelor});

  final Bachelor bachelor;

  @override
  State<StatefulWidget> createState() => _BachelorDetail();
}

class _BachelorDetail extends State<BachelorDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO scaffold
    return Container(
      margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      child: Column(
        children: [
          Text("${widget.bachelor.job}"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
