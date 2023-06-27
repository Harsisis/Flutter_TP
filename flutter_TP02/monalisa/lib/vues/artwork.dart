import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/Mona_Lisa.jpg'),
                const Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Opacity(
                            opacity: 0.75,
                            child: Icon(Icons.favorite,
                                size: 100, color: Colors.white))))
              ],
            ),
            const Text("Mona Lisa",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                )),
            const Text("Léonard De Vinci",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      print("article");
                    },
                    child: const Icon(
                      Icons.article,
                      size: 30,
                    )),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      print("favorite");
                    },
                    child: const Icon(
                      Icons.favorite,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sayHello,
        tooltip: 'button',
        child: const Icon(Icons.add_box_sharp),
      ),
    );
  }
}
