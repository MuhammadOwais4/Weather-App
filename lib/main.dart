import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/weather_app.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: const WeatherApp(),
    ),
  );
}
