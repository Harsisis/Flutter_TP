import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Artwork extends StatelessWidget {
  const Artwork({super.key});

  void _sayHello() {
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Artwork"),
      ),
      body: Center(
        child: Column(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sayHello,
        tooltip: 'button',
        child: const Icon(Icons.add_box_sharp),
      ),
    );
  }
}
