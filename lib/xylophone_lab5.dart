import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  CustomerButton({required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(500, 50),
        ),
        child: Text(''));
    // TODO: implement build
    throw UnimplementedError();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();
  void playAudio(String sound) async {
    await _audioPlayer.play(AssetSource('audio/$sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('XYLOPHONE'),
            ),
            body: Center(
              child: Column(
                children: [
                  CustomerButton(
                    onPressed: () {
                      playAudio('do'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('re'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('mi'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('fa'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('sol'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.purple,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('la'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomerButton(
                    onPressed: () {
                      playAudio('si'); // Đảm bảo rằng tên file là chính xác
                    },
                    color: Colors.teal,
                  ),
                ],
              ),
            )));
  }
}
