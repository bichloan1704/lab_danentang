import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('DICE'),
      ),
      body: DicePage(),
    ));
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var random = Random();
  int leftDice = 1;
  int rightDice = 1;
  void dice() {
    setState(() {
      leftDice = random.nextInt(6) + 1;
      rightDice = random.nextInt(6) + 1;
    });
  }

  final BoxDecoration imgSet = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/dice$leftDice.png',
                  width: 250, height: 250),
              SizedBox(width: 20),
              Image.asset('assets/img/dice$rightDice.png',
                  width: 250, height: 250),
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: dice,
            child: Text('Press'),
          )
        ],
      ),
    );
  }
}
