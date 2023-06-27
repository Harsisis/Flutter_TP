import 'package:flutter/material.dart';

import 'counter_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Widget> _counterList = [];

  void _incrementCounter() {
    setState(() {
      _counterList.add(CounterItem(counter: _counter));
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pomme Poire Ananas"),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: _counterList.length,
          itemBuilder: (context, index) {
            return _counterList[index];
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
