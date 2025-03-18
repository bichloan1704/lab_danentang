import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './input_bmi.dart';
import 'dart:math';

class CaculatorPage extends StatefulWidget {
  final bool isMale;
  final int weight, age;
  final double height;
  const CaculatorPage({
    Key? key,
    required this.isMale,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);
  @override
  CaculatorPageState createState() => CaculatorPageState();
}

class CaculatorPageState extends State<CaculatorPage> {
  late double weightD, result;
  String text = '', suggest = '';

  @override
  void initState() {
    weightD = widget.weight.toDouble();
    result = double.parse((weightD / (pow(widget.height / 100, 2))).toStringAsFixed(1));
    caculate();
  }

  void caculate() {
    setState(() {
      if (result < 18.5) {
        text = 'Cân nặng thấp, cơ thể gầy';
        suggest = 'Bạn cần ăn uống đầy đủ, tập luyện thể dục thể thao';
      } else if (18.5 <= result && result <= 24.9) {
        text = 'Bình thường';
        suggest = 'Cơ thể tốt';
      } else if (25 == result) {
        text = 'Thừa cân';
        suggest = 'Bạn cần tập thể dục và ăn uống lành mạnh hơn';
      } else if (result <= 29.9) {
        text = 'Tiền béo phì';
        suggest = 'Cơ thể bạn đang trở nên béo phì, bạn cần giảm cân';
      } else if (result <= 34.9) {
        text = 'Béo phì cấp độ I';
        suggest =
            'Cơ thể bạn đang béo phì cấp độ I, tình trạng đáng báo động vì cơ thể trở nên quá nặng';
      } else if (result <= 39.9) {
        text = 'Béo phì cấp độ II';
        suggest =
            'Cơ thể bạn đang béo phì cấp độ II, tình trạng đáng báo động vì cơ thể rất dễ mắc nhiều bệnh liên quan đến béo phì';
      } else {
        text = 'Béo phì cấp độ III';
        suggest =
            'Cơ thể trong trạng thái nặng nề và dễ mắc bệnh, bạn cần có kế hoạch để giảm cân và bảo vệ sức khỏe.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [ResultBmi(text: text, result: result, suggest: suggest)],
      ),
    );
  }
}

class ResultBmi extends StatelessWidget {
  final String text, suggest;
  final double result;
  ResultBmi({required this.text, required this.result, required this.suggest});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          
          Text(
            '$result',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          
          Text(
            suggest,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
         
          ResultButton(
              text: "GO BACK HOME",
              color: const Color.fromARGB(255, 181, 145, 142),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
