import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/helpers/helper.dart';

class ForecastCard extends StatelessWidget {
  final Map data;
  const ForecastCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final String dtTxt = data["dt_txt"];
    final DateTime hourlyTime = DateTime.parse(dtTxt);
    return SizedBox(
      height: 140,
      width: 125,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat.jm().format(hourlyTime),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Helpers.getWweatherIcon(data["weather"][0]["main"]),
            Text(
              data["weather"][0]["main"],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
