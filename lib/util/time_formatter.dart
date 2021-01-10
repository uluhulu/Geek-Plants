import 'package:intl/intl.dart';

var formatter = new DateFormat('MMMM yyyy');

String getStringFromDateTime(DateTime time) {
  return formatter.format(time);
}

DateTime getDateTimeFromString(String dateString) {
  return formatter.parse(dateString);
}

String getMonthName(int monthNum) {
  switch (monthNum) {
    case 1:
      return "Января";
    case 2:
      return "Февраля";
    case 3:
      return "Марта";
    case 4:
      return "Апреля";
    case 5:
      return "Мая";
    case 6:
      return "Июня";
    case 7:
      return "Июля";
    case 8:
      return "Августа";
    case 9:
      return "Сентября";
    case 10:
      return "Октября";
    case 11:
      return "Ноября";
    case 12:
      return "Декабря";
    default:
      throw Exception("Неизвестный месяц");
  }
}
