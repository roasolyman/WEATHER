     import 'dart:convert';

import 'package:http/http.dart'as http;



class Weather{
  final int max;//درجه الحراره العظمى
  final int man;//درجه الحراره الصغرى
  final int Current;
  final String name;
  final String day;
  final int wind;
  final int humidity;
  final int chenceRain;
  final String image;
  final String time;
  final String location;

  Weather(this.max, this.man, this.Current, this.name, this.day, this.wind,
      this.humidity, this.chenceRain, this.image, this.time, this.location);
}
 String apId="366ed45a4c134a85aa1125127231612";
Future<List> fetchData(String lat,String lon ,String city) async{

  var url="https://api.weatherapi.com/v1/current.json?key=366ed45a4c134a85aa1125127231612&q=London&$apId=200";
  var response=await http.get(Uri.parse(url));
  DateTime date=DateTime.now();
  if (response.statusCode==200) {
    var res=json.decode(response.body);
    var current=res["current"];
       Weather currentTemp=Weather
         (
           Current:current["temp"].round,
           max,
           man,
           name:current[""][],
           day,
           wind,
           humidity,
           chenceRain,
           image,
           time,
           location
       )
  }
}