import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '95138fdd27e718bd66dda9c795ed52d1'; // Thay bằng API thật của bạn
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Lấy dữ liệu thời tiết thất bại');
    }
  }
}