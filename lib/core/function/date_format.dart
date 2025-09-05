import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime getUtcDateTimeWithZeroHoure() {
    return DateTime.utc(year, month, day);
  }

  String getYearMonthDay({String commaShape = "-"}) {
    // StringBuffer result = StringBuffer();
    // result.write(year.toString());
    // result.write(commaShape);
    // result.write(month.toString());
    // result.write(commaShape);
    // result.write(day.toString());
    // return result.toString();

    final stringDate = toIso8601String().split("T").first;

    final result = stringDate.replaceAll("-", commaShape);

    return result;
  }

  String getYearMonth({String commaShape = "-"}) {
    final stringDate = toIso8601String().split("T").first;

    if (stringDate.length > 7) {
      return stringDate.substring(0, 7);
    } else {
      return "";
    }
  }

  String toReadableDateTime() {
    final dateTime = DateTime.parse(toString());
    final formatter = DateFormat("yyyy-MM-dd hh:mm a");
    return formatter.format(dateTime.toLocal());
  }
}
