import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Magic Ball'),
      ),
      body: MagicPage(),
    ));
  }
}

class MagicPage extends StatefulWidget {
  const MagicPage({super.key});

  @override
  _MagicPageState createState() => _MagicPageState();
}

class _MagicPageState extends State<MagicPage> {
  var random = Random();
  int magicBall = 1;
  void dice() {
    setState(() {
      magicBall = random.nextInt(5) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: dice,
            child: Image.asset('assets/img/ball$magicBall.png',
                width: 250, height: 250),
          )
        ],
      ),
    );
  }
}
