import 'package:flutter/material.dart';
import 'package:solar_hijri_calendar/solar_hijri_calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Solar Hijri Calendar'),
        ),
        body: Center(
          child: BasicCalendar(),
        ),
      ),
    );
  }
}
