class LastTimeFormater {
  static String format(DateTime lastTime){
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year,now.month,now.day,0,0,0,0);
    DateTime local = lastTime.toLocal();
    if (local.isBefore(today.subtract(Duration(days: 7)))) {
      return "${_monthToString(local.month)} ${local.day}, ${local.year}";
    } else if (local.isBefore(today.subtract(Duration(days: 1)))) {
      return _weekdayToString(local.weekday);
    } else if (local.isBefore(today)) {
      return "yesterday";
    } else {
      return "${local.hour}:${local.minute}";
    }
  }
  static String _weekdayToString(int day) {
    List<String> daysOfTheWeek = ["monday","tuesday","wednesday","thursday",
      "friday","saturday","sunday"];
    return daysOfTheWeek[day-1];
  }

  static String _monthToString(int month) {
    List<String> months = ["january","february","march","april","may","june",
      "july","august","september","october","november","december"];
    return months[month-1];
  }
}