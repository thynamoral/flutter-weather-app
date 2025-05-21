import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/additional_information.dart';
import 'package:weather_app/screen/home/header_card.dart';
import 'package:weather_app/screen/home/hourly_forecast_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> fetchWeatherForecast() async {
    try {
      String city = 'London';
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=6be57cf5b230675814db2f86ba0a3521',
        ),
      );
      final data = jsonDecode(response.body);

      if (int.parse(data['cod']) != 200) {
        throw ('Unexpected error occurred');
      } else {
        return data;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = fetchWeatherForecast();
  }

  void refresh() {
    setState(() {
      weather = fetchWeatherForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: refresh, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.redAccent),
              ),
            );
          }

          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemperature = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCard(
                currentTemperature: currentTemperature,
                currentSky: currentSky,
              ),
              SizedBox(height: 20),
              HourlyForecastList(dataList: data),
              SizedBox(height: 20),
              AdditonalInformation(
                humidity: currentHumidity.toString(),
                windSpeed: currentWindSpeed.toString(),
                pressure: currentPressure.toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}
