import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/model/weather.dart';


Future<WeatherClass> fetchWeather() async {
  final response = await http
      .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Ho%20Chi%20Minh%20city&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherClass.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load WeatherClass');
  }
}