import 'package:flutter/material.dart';
import 'package:micard/lab8/result_bmi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Trang đầu tiên
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI')),
      body: Column(
        children: [
          BMIPage(),
          
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  ReusableCard(
      {required this.text,
      required this.icon,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: isSelected
                ? Color.fromARGB(255, 52, 132, 202)
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

class HeightFrame extends StatelessWidget {
  final String text, label;
  final double? currentValue;
  final ValueChanged<double> onChanged;
  HeightFrame(
      {required this.text,
      this.currentValue,
      this.label = '',
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 620,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              currentValue.toString() + " cm",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Slider(
              value: currentValue!,
              min: 50,
              max: 200,
              divisions: 150,
              // label: label,
              onChanged: onChanged,
            )
          ],
        ));
  }
}

class AgeWeightFrame extends StatelessWidget {
  final String text, increase, decrease;
  final int number;
  final VoidCallback onPressed1, onPressed2;
  AgeWeightFrame(
      {required this.text,
      this.number = 0,
      this.increase = "+",
      this.decrease = "-",
      required this.onPressed1,
      required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              '$number',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onPressed1,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 72, 158, 201),
                      foregroundColor: Colors.white,
                      shape: CircleBorder()),
                  child: Text(decrease),
                ),
                ElevatedButton(
                  onPressed: onPressed2,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 72, 158, 201),
                      foregroundColor: Colors.white,
                      shape: CircleBorder()),
                  child: Text(increase),
                ),
              ],
            )
          ],
        ));
  }
}

class ResultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  ResultButton({required this.text, required this.onPressed, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 620,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});
  @override
  BMIPageState createState() => BMIPageState();
}

class BMIPageState extends State<BMIPage> {
  bool isMale = true;

  void setMale() {
    setState(() {
      isMale = true;
    });
  }

  void setFemale() {
    setState(() {
      isMale = false;
    });
  }

  double currentValue = 150;
  int weight = 50;
  int age = 20;
  void countWeight(int i) {
    setState(() {
      if (i == 0) {
        weight--;
      } else {
        weight++;
      }
    });
  }

  void countAge(int i) {
    setState(() {
      if (i == 0) {
        age--;
      } else {
        age++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableCard(
                text: "Male",
                icon: Icons.male,
                isSelected: isMale,
                onTap: setMale),
            SizedBox(width: 20),
            ReusableCard(
                text: "Female",
                icon: Icons.female,
                isSelected: !isMale,
                onTap: setFemale)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        HeightFrame(
          text: "HEIGHT",
          currentValue: currentValue,
          label: currentValue.round().toString(),
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AgeWeightFrame(
                text: 'WEIGHT',
                number: weight,
                decrease: "-",
                onPressed1: () {
                  countWeight(0);
                },
                increase: "+",
                onPressed2: () {
                  countWeight(1);
                }),
            SizedBox(width: 20),
            AgeWeightFrame(
                text: 'AGE',
                number: age,
                decrease: "-",
                onPressed1: () {
                  countAge(0);
                },
                increase: "+",
                onPressed2: () {
                  countAge(1);
                }),
          ],
        ),
        SizedBox(height: 20),
        ResultButton(
            text: "RESULT",
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CaculatorPage(
                  isMale: isMale, 
                  weight : weight, 
                  height: currentValue,
                  age: age,
                  )
                ));
            },
          ),
      ],
    ));
  }
}
