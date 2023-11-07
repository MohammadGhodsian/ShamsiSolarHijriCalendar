import 'package:flutter_test/flutter_test.dart';
import 'package:solar_hijri_calendar/solar_hijri_calendar.dart';

void main() {
  group('SolarHijriCalendar', () {
    test('Greeting test', () {
      final solarHijriCalendar = SolarHijriCalendar();
      const name = 'Misagh';
      final greeting = solarHijriCalendar.greet(name);
      expect(greeting, 'Hello from SolarHijriCalendar. Your name is $name!');
    });

    // Add more tests for other methods or functionality as needed
  });
}
