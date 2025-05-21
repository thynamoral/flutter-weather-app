import 'package:flutter/material.dart';

class AdditonalInformation extends StatelessWidget {
  final String humidity;
  final String windSpeed;
  final String pressure;

  const AdditonalInformation({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdditonalInformationItem(
                icon: Icons.water_drop,
                infoLabel: "Humidity",
                value: humidity,
              ),
              AdditonalInformationItem(
                icon: Icons.air,
                infoLabel: "Wind Speed",
                value: windSpeed,
              ),
              AdditonalInformationItem(
                icon: Icons.beach_access,
                infoLabel: "Pressure",
                value: pressure,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AdditonalInformationItem extends StatelessWidget {
  final IconData icon;
  final String infoLabel;
  final String value;

  const AdditonalInformationItem({
    super.key,
    required this.icon,
    required this.infoLabel,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Icon(icon, size: 32),
        Text(
          infoLabel,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
