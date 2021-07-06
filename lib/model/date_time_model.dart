
class DateTimeModel{
  static String getOnlyDate(DateTime dt)
  {
    String year='${dt.year}';
    String month= dt.month<10 ? '0${dt.month}' : '${dt.month}';
    String day = dt.day < 10 ? '0${dt.day}' : '${dt.day}';
    return '$year-$month-$day';
  }
}