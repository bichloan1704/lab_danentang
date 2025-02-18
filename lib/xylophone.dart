import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('XYLOPHONE'),
      ),
      body: PonePage(),
    ));
  }
}

class PonePage extends StatefulWidget {
  const PonePage({super.key});

  @override
  _PonePageState createState() => _PonePageState();
}

class _PonePageState extends State<PonePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  void playSound(String sound) async {
    await _audioPlayer.play(AssetSource('audio/$sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              playSound("do"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              playSound("re"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              playSound("mi"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.pink,
            ),
            onPressed: () {
              playSound("fa"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              playSound("sol"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.purple,
            ),
            onPressed: () {
              playSound("la"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 50),
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              playSound("si"); // Đảm bảo rằng tên file là chính xác
            },
            child: null,
          ),
        ],
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
