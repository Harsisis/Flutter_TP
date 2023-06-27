import 'dart:math';

import 'package:casino/vues/casino_item.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CasinoBody extends StatefulWidget {
  const CasinoBody({super.key});

  @override
  State<CasinoBody> createState() => _CasinoBodyState();
}

class _CasinoBodyState extends State<CasinoBody> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  int _value1 = 0;
  int _value2 = 0;
  int _value3 = 0;

  void _play() {
    setState(() {
      _value1 = Random().nextInt(7);
      _value2 = Random().nextInt(7);
      _value3 = Random().nextInt(7);

      _value1 = 6;
      _value2 = 6;
      _value3 = 6;

      if (_value1 == _value2 && _value2 == _value3) {
        _showSimpleModalDialog(context);
        _confettiController.play();
      }
    });
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 150),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Jackpot !",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                              wordSpacing: 1)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirection: -pi / 2,
                        numberOfParticles: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Casino"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CasinoItem(value: _value1),
              CasinoItem(value: _value2),
              CasinoItem(value: _value3),
            ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _play,
        tooltip: 'play',
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
