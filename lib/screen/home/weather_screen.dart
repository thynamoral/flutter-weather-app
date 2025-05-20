import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/additional_information.dart';
import 'package:weather_app/screen/home/header_card.dart';
import 'package:weather_app/screen/home/hourly_forecast_list.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderCard(),
          SizedBox(height: 20),
          const HourlyForecastList(),
          SizedBox(height: 20),
          const AdditonalInformation(),
        ],
      ),
    );
  }
}
