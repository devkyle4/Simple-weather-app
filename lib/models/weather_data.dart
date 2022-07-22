//CLASS FOR GETTING WEATHER DATA
class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

//CLASS FOR GETTING TEMPERATURE DATA
class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

//CLASS FOR COMBINING ALL THE REQUIRED DATA

class WeatherResponse {
  final TemperatureInfo tempInfo;
  final String cityName;
  final WeatherInfo weatherInfo;

  WeatherResponse(
      {required this.tempInfo,
      required this.cityName,
      required this.weatherInfo});

  String get iconUrl {
    return "https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png";
  }

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        tempInfo: tempInfo, cityName: cityName, weatherInfo: weatherInfo);
  }
}
