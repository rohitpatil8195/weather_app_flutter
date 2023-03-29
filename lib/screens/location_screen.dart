import 'package:flutter/material.dart';
import 'package:weather_app_flutter/utilities/constants.dart';
import 'package:weather_app_flutter/services/weather.dart';
class LocationScreen extends StatefulWidget {
   const LocationScreen({super.key, this.locationWeather,});
   final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
 late int temperature;
 late int condition;
 late String cityName;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
 WeatherModel getWeather=WeatherModel();
  void updateUI(dynamic weatherDate){
    double temp=weatherDate['main']['temp'];
setState(() {
  temperature=temp.toInt();
  condition=weatherDate['weather'][0]['id'];
  cityName=weatherDate['name'];
});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children:  <Widget>[
                    Text(
                      // '32°',
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                     Text(
                      getWeather.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "${getWeather.getMessage(temperature)} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
