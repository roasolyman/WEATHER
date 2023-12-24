import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'home.dart';



class Weather{
  final int ?max;//درجه الحراره العظمى
  final int ?man;//درجه الحراره الصغرى
  final int ?Current;
  final String ?name;
  final String ?day;
  final int ?wind;
  final int ?humidity;
  final int ?chenceRain;
  final String ?image;
  final String ?time;
  final String ?location;

  Weather({this.max, this.man, this.Current, this.name, this.day, this.wind,
    this.humidity, this.chenceRain, this.image, this.time, this.location});
}
String apId="366ed45a4c134a85aa1125127231612";


String ?findIcon (String name ){
  switch (name){
    case "clouds":
      return "assets/sunny.png";
      break;
    case "Rain":
      return"assets/rainy.png";
      break;
    case "Drizzle":
      return"assets/rainy.png";
      break;
    case "Thunderstorm":
      return"assets/thunderstorm.png";
      break;
    case "Snow":
      return"assets/snow.png";
      break;
    default:
      return"assets/sunny.png";


  }
}

class CityModel{
  final String ?name ;
  final String ?lat ;
  final String ?lon;
  CityModel(this.name, this.lat, this.lon);

}
var cityJson ;
Future<dynamic> fetchWeatherData(String city) async {
  final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=366ed45a4c134a85aa1125127231612&q=$city'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
@override
Widget build(BuildContext context) {
  return FutureBuilder<dynamic>(
    future: fetchWeatherData('London'),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.hasData) {
        return Text('Temperature: ${snapshot.data['current']['temp_c']}°C');
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );

   /* for (int i=0;i<citJosn.lengtj;i++){
  if (cityJson[i]["name"].toSting ().tolowerCase()==city.toLowerCase()){
  return CityModel;
  {
  name:cityJason[i]["name"].toString(),
  lat: cityJason [i]["Latitude"].toString(),
  lon:cityJason [i]["Longitude"].toString()
  var current = res["current"];
  Weather currentTemp = Weather
  (
  Current: current["temp"].round(),
  name: current["weather"][0]["main"],
  day: DateFormat("EEE dd MMM").format(data),
  wind: current ["wind_speed"].round(),
  humidtiy: current["humidity"].round(),
  chanceRain: current["uvi"].round(),
  location: city,
  image: findIcon(current["weather"][0]["main"].toString())
  );
  List <Weather>todayWeather = [];
  int hour = int.parse(DataFormat("hh").format(date));
  for (var i = 0; i < 4; i =++) {
  var temp = res["hourly"];
  Weather hourly = Weather
  (
  Current: temp["temp"].round(),
  image: findIcon(temp[i]["weather"][0]["main"].toString())
  time:Duration(hours:hour+i+1).toString().split(":")[0] + ":00"

  );
  todayWeather.add(hourly);

  }
  var daily=res["daily"][0];
  Weather tomorrowTemp =Weather(
  max:daily["temp"]["max"].round(),
  min:daily["temp"]["min"].round(),
  image:findIcon(daily["weather"][0]["main"].toString()),
  name:daily ["weather"][0]["main"],
  wind:daily["wind_speed"].round(),
  humidtiy:daily["humidity"].round(),
  chanceRain:daily["uvi"].round(),

  );
  List <Weather>sevenDays=[];
  for (var i=1;i<8;i++){
  String day=DateFormat("EEEE").format(DateTime(date.year,date.month,date.day=i+1)).substring(0,3);
  var = temp=res["daily"][i]
  max:daily["temp"]["max"].round(),
  min:daily["temp"]["min"].round(),
  name:daily ["weather"][0]["main"],
  image:findIcon(daily["weather"][0]["main"].toString()),
  day:day
  };
  sevenDays.add(hourly);
  }
  return [currentTemp,todayWearther,tomorrowTemp,sevenDays]
  */



  }
