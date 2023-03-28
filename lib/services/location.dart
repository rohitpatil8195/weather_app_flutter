import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  late double? longitude;
   late double? latitude;
   Location();

   Future<void> getCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude=position.longitude;
      latitude=position.latitude;
    }catch(e){
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      print(e);
    }
  }

}
