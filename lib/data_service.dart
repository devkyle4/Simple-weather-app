import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_weather_app/models/weather_data.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
//api.openweathermap.org/data/2.5/weather?q=London,uk&APPID={api key}
    final queryParameters = {
      'q': city,
      'appid': '##################################',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}
