import 'package:intl/intl.dart';

var formatter = new DateFormat('MMMM yyyy');

String getStringFromDateTime(DateTime time) {
  return formatter.format(time);
}

DateTime getDateTimeFromString(String dateString) {
  return formatter.parse(dateString);
}
