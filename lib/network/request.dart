import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/model/weather.dart';

Future<WeatherClass> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Ho%20Chi%20Minh%20city&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8'));

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

// Future<List<dynamic>> searchPlaces(String query) async {
//   String url =
//       'https://api.geoapify.com/v1/geocode/autocomplete?text=$query&apiKey=188c7813599f48708c016d3d3e9a0027';
//   http.Response response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Map<String, dynamic> responseBody = json.decode(response.body);
//     List<dynamic> predictions = responseBody['features'];
//     return predictions;
//   } else {
//     return [];
//   }
// }

class GeoapifyPlacesApi {
  final String _baseUrl = 'https://api.geoapify.com/v1/geocode';
  final String _apiKey;

  GeoapifyPlacesApi({required String apiKey}) : _apiKey = apiKey;

  Future<List<Place>> autocomplete({required String query}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/autocomplete?text=$query&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final features = data['features'] as List<dynamic>;
      return features.map((f) => Place.fromJson(f)).toList();
    } else {
      throw Exception('Failed to autocomplete places');
    }
  }
}

class Place {
  final String name;
  final String formatted;
  final double lat;
  final double lng;
  final String placeId;

  Place({
    required this.name,
    required this.formatted,
    required this.lat,
    required this.lng,
    required this.placeId,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'] as Map<String, dynamic>;
    final geometry = json['geometry'] as Map<String, dynamic>;
    final coordinates = geometry['coordinates'] as List<dynamic>;
    return Place(
      name: properties['name'],
      formatted: properties['formatted'],
      lat: coordinates[1],
      lng: coordinates[0],
      placeId: properties['place_id'],
    );
  }
}
