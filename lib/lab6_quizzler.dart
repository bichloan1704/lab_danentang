import 'package:flutter/material.dart';

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
          // textStyle: TextStyle(color: Colors.white)
        ),
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white),
        ));
  }
}

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
  
  late String text;
  int i = 0;
  @override
  void initState(){
    super.initState();
    text = question[i];
  }
  void quizz() {
    setState(() {
      if(i<5){
        i++;
        text = question[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: 
              Text('$text', style: TextStyle(fontSize: 20),)
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChoiceButton(
                onPressed: () {
                  quizz();
                },
                color: Colors.green,
                text: "ĐÚNG",
              ),
              SizedBox(height: 20),
              ChoiceButton(
                onPressed: () {
                  quizz();
                },
                color: Colors.red,
                text: "SAI",
              )
            ],
          )
        ],
      ),
    );
  }
}
