import 'package:cute_weather_v2/models/daily.dart';
import 'package:cute_weather_v2/models/info.dart';
import 'package:cute_weather_v2/utils/date_time_converter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DayList extends StatelessWidget {
  const DayList({
    Key? key,
    required this.info,
  }) : super(key: key);

  final Info info;

  @override
  Widget build(BuildContext context) {
    final List<Daily> daily = info.daily;
    final int offset = info.timezoneOffset;
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daily.length,
        itemBuilder: (context, i) {
          final Daily item = daily[i];
          final String dayOfWeek = DateFormat.E(
            context.locale.languageCode,
          ).format(
            DateTimeConverter.convert(item.dt, offset),
          );
          final String monthAndDay = DateFormat.MMMd(
            context.locale.languageCode,
          ).format(
            DateTimeConverter.convert(item.dt, offset),
          );
          return Padding(
            padding: EdgeInsets.only(right: i < 7 ? 10 : 0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: const Color.fromARGB(75, 214, 214, 214)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      dayOfWeek,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      monthAndDay,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/${item.weather.icon}.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Text(
                    '${'highTemp'.tr()}: ${item.temp.max.round()}°C',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    '${'lowTemp'.tr()}: ${item.temp.min.round()}°C',
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
