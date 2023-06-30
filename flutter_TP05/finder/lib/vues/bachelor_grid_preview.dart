import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/bachelor.dart';

class BachelorGridPreview extends StatefulWidget {
  const BachelorGridPreview({super.key, required this.bachelor});

  final Bachelor bachelor;

  @override
  State<StatefulWidget> createState() => _BachelorGridPreview();
}

class _BachelorGridPreview extends State<BachelorGridPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/details/${widget.bachelor.id}");
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Image.asset(
                widget.bachelor.avatar,
                height: 175,
                width: 175,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "${widget.bachelor.firstname} ${widget.bachelor.lastname}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(
                      "${widget.bachelor.description}",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
