import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    String url =
        '${dotenv.get('OPEN_WEATHER_MAP_URL')}?q=hanoi&appid=${dotenv.get('API_WEATHER_KEY')}&units=metric';
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: dotenv.get('API_WEATHER_KEY'),
      });
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition <= 805) {
      return 'โ๏ธ';
      // } else if (condition <= 804) {
      //   return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
