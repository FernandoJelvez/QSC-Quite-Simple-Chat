class LastTimeFormater {
  static String format(DateTime lastTime){
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year,now.month,now.day,0,0,0,0);
    DateTime local = lastTime.toLocal();
    if (local.isBefore(today.subtract(Duration(days: 7)))) {
      return "${local.month} ${local.day}, ${local.year}";
    } else if (local.isBefore(today.subtract(Duration(days: 1)))) {
      return _weekdayToString(local.weekday);
    } else {
      return "${local.hour}:${local.minute}";
    }
  }
  static String _weekdayToString(int day) {
    switch (day) {
      case 1:
        return "monday";
      case 2:
        return "tuesday";
      case 3:
        return "wednesday";
      case 4:
        return "thursday";
      case 5:
        return "friday";
      case 6:
        return "saturday";
      case 7:
        return "sunday";
      default:
        return "long ago";
    }
  }
}