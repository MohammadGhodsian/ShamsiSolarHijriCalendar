// lib/extensions.dart

// Import the shamsi_date package
import 'package:shamsi_date/shamsi_date.dart';

// Create an extension for Jalali
extension JalaliExtensions on Jalali {
  bool equalDates(Jalali other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // Method to return a simplified date string, e.g., "1402-01-01"
  String toStringYyyyMmDd() {
    return '${year}-${_twoDigit(month)}-${_twoDigit(day)}';
  }

  String _twoDigit(int number) {
    return number.toString().padLeft(2, '0');
  }
}
