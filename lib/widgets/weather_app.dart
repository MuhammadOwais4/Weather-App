import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/env.dart';
import 'package:weatherapp/widgets/additional_information_card.dart';
import 'package:weatherapp/widgets/forecast_card.dart';
import 'package:weatherapp/widgets/main_box.dart';
import 'package:weatherapp/widgets/section_title.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  Future<List> fetchWeatherData() async {
    try {
      String api =
          "https://api.openweathermap.org/data/2.5/forecast?q=Karachi,pakistan&APPID=$API_KEY";

      final result = await http.get(Uri.parse(api));
      final data = jsonDecode(result.body);
      return data["list"];
    } catch (ex) {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final data = snapshot.data!;
            final currentData = data[0];

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainBox(
                    currentData: currentData,
                  ),
                  const SectionTitle(
                    title: "Hourly Forecast",
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) => ForecastCard(
                        data: data[index + 1],
                      ),
                    ),
                  ),
                  const SectionTitle(
                    title: "Additional Information",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdditionalInformationCard(
                        title: "Humidity",
                        icon: Icons.water_drop,
                        val: currentData["main"]["humidity"].toString(),
                      ),
                      AdditionalInformationCard(
                        title: "Pressure",
                        icon: Icons.thermostat,
                        val: currentData["main"]["pressure"].toString(),
                      ),
                      AdditionalInformationCard(
                        title: "Wind",
                        icon: Icons.air,
                        val: currentData["wind"]["speed"].toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Some Error Occured",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
