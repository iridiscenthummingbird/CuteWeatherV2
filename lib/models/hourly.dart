import 'package:cute_weather_v2/models/weather.dart';

class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final Weather weather;

  Hourly(
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
  );

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      json['dt'],
      double.parse(json['temp'].toString()),
      double.parse(json['feels_like'].toString()),
      json['pressure'],
      json['humidity'],
      Weather.fromJson(json['weather'][0]),
    );
  }
}
