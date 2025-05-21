import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/screen/home/hourly_forecast_item.dart';

class HourlyForecastList extends StatelessWidget {
  final Map<String, dynamic> dataList;
  const HourlyForecastList({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  final hourlyForecastTime = DateTime.parse(
                    dataList['list'][index + 1]['dt_txt'],
                  );
                  final hourlyForecastSky =
                      dataList['list'][index + 1]['weather'][0]['main'];
                  final hourlyForecastTemp =
                      dataList['list'][index + 1]['main']['temp'];
                  bool isCloud =
                      hourlyForecastSky == "Clouds" ||
                      hourlyForecastSky == "Rain";
                  return HourlyForecastItem(
                    time: DateFormat.j().format(hourlyForecastTime),
                    icon: isCloud ? Icons.cloud : Icons.sunny,
                    temerature: hourlyForecastTemp.toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
