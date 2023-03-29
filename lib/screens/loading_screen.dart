
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/location_screen.dart';
import 'package:weather_app_flutter/services/location.dart';
import 'package:weather_app_flutter/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apiKey='1120feb191caa933432854b82d3f503f';
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
    Location location=Location();
     await location.getCurrentLocation();
       NetwordHelper networdHelper=NetwordHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
     var weatherDate=await networdHelper.getData();

    if (context.mounted) {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return LocationScreen(locationWeather:weatherDate);
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
