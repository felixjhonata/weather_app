import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  late int id;
  late String name;
  late double temp;
  late double wind;
  late int humidity;
  late String location;

  Weather(Response response) {
    var body = jsonDecode(response.body);

    id = body["weather"][0]["id"];
    name = body["weather"][0]["main"];
    temp = body["main"]["temp"];
    wind = body["wind"]["speed"];
    humidity = body["main"]["humidity"];
    location = body["name"];
  }

  String getSvgPath(bool isNight) {
    if (id >= 803) {
      return "cloudy.svg";
    }

    if (id >= 801) {
      return isNight ? "cloudy_night.svg" : "cloudy_day.svg";
    }

    if (id == 800) {
      return isNight ? "night.svg" : "sunny.svg";
    }

    if (id >= 700) {
      return "misty.svg";
    }

    if (id >= 600 || id == 511) {
      return "snowy.svg";
    }

    if (id >= 300) {
      return "rainy.svg";
    }

    return "thunderstorm.svg";
  }
}
