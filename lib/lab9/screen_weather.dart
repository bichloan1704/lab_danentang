import 'package:flutter/material.dart';
import 'weather_services.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  WeatherHomeState createState() => WeatherHomeState();
}

class WeatherHomeState extends State<WeatherHome> {
  final controller = TextEditingController();
  String? temperature, description, city;
  final weatherService = WeatherService();

  void getWeather() async {
    try {
      final data = await weatherService.fetchWeather(controller.text);
      setState(() {
        temperature = data['main']['temp'].toString();
        description = data['weather'][0]['description'];
        city = data['name'];
      });
    } catch (e) {
      setState(() {
        temperature = null;
        description = "Couldn't find information";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Climate")),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.lovepik.com/photo/48017/2281.jpg_wh860.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white, // Màu chữ bên trong TextField
                          fontSize: 16,
                        ),
                        controller: controller,
                        decoration: InputDecoration(
                            labelText: "Enter the city",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: getWeather, child: Text("Show up")),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  children: [
                    if (temperature != null)
                      Column(
                        children: [
                          Text(
                            "City: $city",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Temperature: $temperature *C",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            ),
                          Text(
                            "Description: $description",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            ),
                        ],
                      )
                  ],
                )
              ],
            )));
  }
}
