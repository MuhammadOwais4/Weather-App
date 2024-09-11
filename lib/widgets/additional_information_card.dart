import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String val;

  const AdditionalInformationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 125,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon,
              size: 40,
            ),
            Text(
              val,
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
