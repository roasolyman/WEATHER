import 'dart:convert';

import 'package:flutter/material.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late Future<dynamic> _weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Temperature: ${snapshot.data['main']['temp']}°C');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _weatherData = fetchWeatherData('London');
          });
        },
        tooltip: 'Fetch Weather',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Future<dynamic> fetchWeatherData(String city) async {
  final response = await http.get(
      '''
http://api.openweathermap.org/data/2.5/weather?q=$city&appid={366ed45a4c134a85aa1125127231612}''' as Uri);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
