import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Destini'),
      ),
      body: DestiniPage(),
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

class DestiniPage extends StatefulWidget {
  const DestiniPage({super.key});
  @override
  _DestiniPageState createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  List<String> story1 = [
    'He says that snakes are easy as they don’t have any legs.',
    'My father is a scientist. He works to save rare birds.',
    'Some are really clever and can even say some words.',
    'My mother is a dog groomer. She loves dogs big and small.',
    'Once she styled a poodle. It looked just like a ball.'
  ];
  List<String> story2 = [
    'The grapes seemed ready to burst with juice',
    'The bunch hung from a high branch, and the fox had to jump for it.',
    'So he walked off a short distance and took a running leap',
    'Then he sat down and looked at the grapes in disgust.',
    'And off he walked very, very scornfully.'
  ];
  late String text;
  @override
  void initState() {
    super.initState();
    text = "When I grow up I’ll work with animals. I don’t know which job yet.";
  }

  int i = 0;

  void changeOption(List<String> story) {
    setState(() {
      if (i < story.length) {
        text = story[i];
        print(i);
      }
      if (i == 5) {
        i = 0;
        text = story[i];
        i++;
        return;
      }
      i++;
    });
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
                  changeOption(story1);
                },
                color: const Color.fromRGBO(76, 175, 80, 1),
                text: i < story1.length ? story1[i] : "RESTART",
              ),
              SizedBox(height: 20),
              ChoiceButton(
                onPressed: () {
                  changeOption(story2);
                },
                color: Colors.red,
                text: i < story2.length ? story2[i] : "RESTART",
              )
            ],
          ),
        ],
      ),
    );
  }
}
