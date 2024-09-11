import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/helper.dart';

class MainBox extends StatelessWidget {
  final Map currentData;
  const MainBox({
    super.key,
    required this.currentData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${(currentData["main"]["temp"] - 273.15).toStringAsFixed(2)} °C",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Helpers.getWweatherIcon(currentData["weather"][0]["main"]),
                Text(
                  currentData["weather"][0]["description"],
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
