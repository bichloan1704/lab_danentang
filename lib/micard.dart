import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'img/micard.jpg',
                    width: 100,
                    height: 100,  
                  ), 
                ),
                Text(
                  'Bích Loan',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 33, 115, 215),
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 127, 155, 189),
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                        hintText: '+84 234 789 324',
                        border: OutlineInputBorder(),
                      ),
                      ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                      hintText: 'loanntb.22itb@vku.udn.vn',
                      border: OutlineInputBorder(),
                    ),
                    ),
                    ],
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
}
