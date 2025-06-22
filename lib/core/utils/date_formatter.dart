import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }

  static String formatFullDate(DateTime dateTime) {
    return DateFormat('EEEE, MMMM d, yyyy').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}
