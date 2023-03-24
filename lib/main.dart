import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gap/gap.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: const DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int rightDiceNumber = 6;
  int leftDiceNumber = 6;
  var total = 12;

  void changeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      total = rightDiceNumber + leftDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'YOUR ROLLED: ',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            '$total',
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Gap(80),
          Row(
            children: [
              Expanded(
                // flex: 12,
                child: TextButton(
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  onPressed: () => changeDice(),
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: () => changeDice(),
                ),
              ),
            ],
          ),
          const Gap(80),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(10),
              side: BorderSide(width: 2.0, color: Colors.white),
            ),
            onPressed: changeDice,
            child: const Text(
              'Roll Dices',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
