import 'package:flutter/material.dart';

abstract class Helpers {
  static Widget getWweatherIcon(String description) {
    IconData icon;
    switch (description) {
      case "Clouds":
        icon = Icons.cloud;
        break;
      case "Rain":
        icon = Icons.shower;
        break;
      case "Snow":
        icon = Icons.cloudy_snowing;
        break;
      case "Sunny" || "Clear":
        icon = Icons.sunny;
        break;
      case "Thunderstrom":
        icon = Icons.thunderstorm_outlined;
        break;
      default:
        icon = Icons.tag_faces_sharp;
    }
    return Icon(
      icon,
      size: 60,
    );
  }
}
