import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final double currentTemperature;
  final String currentSky;

  const HeaderCard({
    super.key,
    required this.currentTemperature,
    required this.currentSky,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Text(
                  "${currentTemperature.toString()}K",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Icon(
                  currentSky == "Clouds" || currentSky == "Rain"
                      ? Icons.cloud
                      : Icons.sunny,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  currentSky,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
