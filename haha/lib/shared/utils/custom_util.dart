// ignore_for_file: avoid_print

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timeago/timeago.dart' as time_ago;

class CustomUtil {
  static bool isNotEmptyValue(Map<String, dynamic> map, String key) {
    return map.containsKey(key) &&
        map[key] != null &&
        map[key].toString().isNotEmpty;
  }

  static bool isExistValue(Map<String, dynamic> map, String key) {
    return map.containsKey(key) && map[key] != null;
  }

  static dynamic getFromMap(Map<String, dynamic> map, String key) {
    return CustomUtil.isExistValue(map, key) ? map[key] : null;
  }

  static Map<String, dynamic> getMapFromMap(
      Map<String, dynamic> map, String key) {
    return CustomUtil.isExistValue(map, key) ? map[key] : {};
  }

  static String getStringFromMap(Map<String, dynamic> map, String key) {
    return CustomUtil.isNotEmptyValue(map, key) ? map[key].toString() : "";
  }

  static String getStringDefaultFromMap(
      Map<String, dynamic> map, String key, String def) {
    return CustomUtil.isNotEmptyValue(map, key) ? map[key] : def;
  }

  static double? getDoubleFromMap(Map<String, dynamic> map, String key) {
    return CustomUtil.isExistValue(map, key)
        ? double.tryParse(map[key].toString())
        : 0;
  }

  static int getIntFromMap(Map<String, dynamic> map, String key) {
    return CustomUtil.isExistValue(map, key) ? map[key] : 0;
  }

  static bool getBoolFromMap(Map<String, dynamic> map, String key) {
    return CustomUtil.isExistValue(map, key) ? map[key] : false;
  }

  static String getDoubleFormatted(double val) {
    return (val).toCurrencyString(thousandSeparator: ThousandSeparator.Period);
  }

  static String getDoubleFormattedNonMantissa(double val) {
    return (val).toCurrencyString(
        thousandSeparator: ThousandSeparator.Period, mantissaLength: 0);
  }

  static String getIntFormatted(int val) {
    return (val).toCurrencyString(
        thousandSeparator: ThousandSeparator.Period, mantissaLength: 0);
  }

  static DateTime? stringToDateTime(String strDate) {
    if (strDate.isNotEmpty) {
      try {
        return DateTime.parse(strDate);
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

/*
  static DateTime stringToTime(String strDate) {
    if (strDate != null && strDate.isNotEmpty) {
      try {
        return  DateFormat()('HH:mm').format();
      } catch (e) {}
    }
    return null;
  }
*/
  static String unixTimeStampToDateTime(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat('EEEE, dd MM yyyy HH:mm');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
  }

  static String unixTimeStampToDateTimeWithoutDay(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat('yyyy-MM-dd HH:mm:ss', 'id');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
  }

  static String unixTimeStampToDate(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat.yMMMMEEEEd('id');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
  }

  static String unixTimeStampToDateWithoutDay(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat.yMMMMd('id');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
  }

  static String unixTimeStampToDateDocs(int millisecond) {
    initializeDateFormatting();
    var formatDay = DateFormat('EEEE', 'id');
    var day = formatDay
        .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));

    var formatDate = DateFormat.yMMMd('id');
    return day +
        ',\n' +
        formatDate
            .format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
  }

  static String unixTimeStampToDateWithoutMultiplication(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat.yMMMMEEEEd('id');
    return format.format(DateTime.fromMillisecondsSinceEpoch(millisecond));
  }

  static String unixTimeStampToTimeAgo(int millisecond) {
    initializeDateFormatting();
    var format = DateFormat.yMMMMEEEEd('id');
    var dateString =
        format.format(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));
    Duration diff = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(millisecond * 1000));

    if (diff.inDays > 7) {
      return dateString;
    } else if (diff.inDays > 0) {
      return "${diff.inDays} hari yang lalu";
    } else if (diff.inHours > 0) {
      return "${diff.inHours} jam yang lalu";
    } else if (diff.inMinutes > 0) {
      return "${diff.inMinutes} menit yang lalu";
    } else {
      return "Baru saja";
    }
  }

  static String fromTimeMillis(int millisecond) {
    time_ago.setLocaleMessages('id', time_ago.IdMessages());

    return time_ago.format(
        DateTime.fromMillisecondsSinceEpoch(millisecond * 1000),
        locale: 'id');
  }

  static String dateTimeToString(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  static String dateToString(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String timeToString(DateTime date) {
    return DateFormat('HH:mm:ss').format(date);
  }

  static String intToDateTimeString(int date) {
    final f = DateFormat('yyyy-MM-dd HH:mm');
    return f.format(DateTime.fromMicrosecondsSinceEpoch(date * 1000));
  }

  static String intToTimeString(int date) {
    final f = DateFormat('HH:mm');
    return f.format(DateTime.fromMicrosecondsSinceEpoch(date * 1000));
  }

  static String stringToTimeString(String sdate) {
    if (sdate.isNotEmpty) {
      final date = stringToDateTime(sdate);
      final f = DateFormat('HH:mm');
      return f.format(date!);
    }
    return "";
  }
}
