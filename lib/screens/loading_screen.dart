
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   @override
  void initState(){
   super.initState();
  getLocationData();
   }

  void getLocationData()async{
    var data=await WeatherModel().getLocationWeather();
    if (context.mounted) {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return LocationScreen(locationWeather:data);
       }));
    }
     }

  Widget build(BuildContext context) {

    return const Scaffold(
      body: SpinKitDoubleBounce(
          color:Colors.white,
          size : 70.0,
        duration: Duration(milliseconds: 2000),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       getLocation();
      //       //Get the current location
      //     },
      //     child: const Text('Get Location'),
      //   ),
      // ),
    );
  }
}
