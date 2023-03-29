import 'package:weather_app_flutter/services/location.dart';
import 'package:weather_app_flutter/services/networking.dart';
const apiKey='1120feb191caa933432854b82d3f503f';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';
const openWeatherByCity='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  getCityWeather(String cityName)async{
    NetwordHelper networkHelper=NetwordHelper('$openWeatherByCity?q=$cityName&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }


   Future<dynamic> getLocationWeather()async{
     Location location=Location();
     await location.getCurrentLocation();
     NetwordHelper networkHelper=NetwordHelper('$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
     var weatherData=await networkHelper.getData();
     return weatherData;
   }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }


}
