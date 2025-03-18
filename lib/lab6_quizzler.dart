import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quizzler'),
      ),
      body: QuizzPage(),
    ));
  }
}

class ChoiceButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;

  ChoiceButton(
      {required this.onPressed, this.color = Colors.blue, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(500, 50),
        ),
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white),
        ));
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<String> question = [
    'Cá vàng có thể nhớ mọi thứ suốt đời.',
    'Nước sôi ở 100°C ở mọi nơi trên Trái Đất.',
    'Tất cả các hành tinh trong hệ Mặt Trời đều quay theo cùng một hướng.',
    'Mật ong không bao giờ bị hỏng.',
    'Con người chỉ sử dụng 10% bộ não của mình.'
  ];
  List<int> answer = [0, 1, 1, 1, 0];
  late String text;
  int i = 0;
  int score = 0;
  @override
  void initState() {
    super.initState();
    text = question[i];
  }

  void quizz(int yourAnswer) {
    setState(() {
      if (i < question.length && answer[i] == yourAnswer) {
        score += 2;
      }
      i++;
      if (i == 5) {
        text = 'Your Score: $score';
        return;
      }
      if (i == 6) {
        i = 0;
        score = 0;
        text = question[i];
        return;
      }
      text = question[i];
    });
  }

  void restart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            '$text',
            style: TextStyle(fontSize: 20),
          ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChoiceButton(
                onPressed: () {
                  quizz(1);
                },
                color: Colors.green,
                text: i == 5 ? "RESTART" : "ĐÚNG",
              ),
              SizedBox(height: 20),
              ChoiceButton(
                onPressed: () {
                  quizz(0);
                },
                color: Colors.red,
                text: i == 5 ? "RESTART" : "SAI",
              )
            ],
          ),
        ],
      ),
    );
  }
}
