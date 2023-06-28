import 'package:flutter/material.dart';

import '../models/bachelor.dart';
import 'bachelor_detail.dart';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview({super.key, required this.bachelor});

  final Bachelor bachelor;

  @override
  State<StatefulWidget> createState() => _BachelorPreview();
}

class _BachelorPreview extends State<BachelorPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BachelorDetail(bachelor: widget.bachelor)),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Image.asset(
                widget.bachelor.avatar,
                height: 50,
                width: 50,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.bachelor.firstname} ${widget.bachelor.lastname}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Text("${widget.bachelor.description}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
