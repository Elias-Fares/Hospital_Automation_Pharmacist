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
}
