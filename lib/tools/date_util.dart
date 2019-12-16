class DateUtil {
  ///时间戳格式化
  static String getFormatDate(num timestamps, String format) {
    DateTime time = DateTime.fromMicrosecondsSinceEpoch(timestamps);
    return "${time.year}-${time.month}-${time.day}";
  }
}
