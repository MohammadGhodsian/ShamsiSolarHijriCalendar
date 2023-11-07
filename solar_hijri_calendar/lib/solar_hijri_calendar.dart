// lib/solar_hijri_calendar.dart

library solar_hijri_calendar;

import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:solar_hijri_calendar/extensions.dart';

class BasicCalendar extends StatefulWidget {
  @override
  _BasicCalendarState createState() => _BasicCalendarState();
}

class _BasicCalendarState extends State<BasicCalendar> {
  late Jalali _displayedMonth;

  @override
  void initState() {
    super.initState();
    _displayedMonth = Jalali.now();
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = _displayedMonth.addMonths(1);
    });
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = _displayedMonth.addMonths(-1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left_rounded),
                onPressed: _previousMonth,
              ),
              Text(
                '${_displayedMonth.year} - ${_displayedMonth.formatter.mm}',
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                onPressed: _nextMonth,
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 7 days in a week
            ),
            itemCount: _displayedMonth.monthLength,
            itemBuilder: (context, index) {
              Jalali shamsiDate = _displayedMonth.copy(day: index + 1);
              return _buildDayItem(context, shamsiDate);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDayItem(BuildContext context, Jalali day) {
    return Container(
      decoration: _isToday(day)
          ? BoxDecoration(
              color: Colors.blue, // Highlight today's date
              borderRadius: BorderRadius.circular(16.0),
            )
          : null,
      child: Center(
        child: Text(
          day.toStringYyyyMmDd(),
        ),
      ),
    );
  }

  bool _isToday(Jalali day) {
    return day.equalDates(Jalali.now());
  }
}
