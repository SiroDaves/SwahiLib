import 'dart:core';
import 'dart:io';

import 'package:intl/intl.dart';

import '../data/models/session.dart';

String dateNow() {
  return DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());
}

String getIso8601Date() {
  final now = DateTime.now().toUtc();
  return '${now.toIso8601String()}Z';
}

String formatTime(String dateTimeString) {
  try {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the time to "hh:mm a" (e.g., 10:30 AM)
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  } catch (e) {
    return 'Invalid date format';
  }
}

String getDayNumber(String date, List<Session> sessions) {
  final dateTime = DateTime.parse(date);

  final firstDate =
      DateTime.parse(sessions.first.startsAt?.substring(0, 10) ?? '');
  return (DateTime(dateTime.year, dateTime.month, dateTime.day)
              .difference(firstDate)
              .inDays +
          1)
      .toString();
}

String truncateString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  }
  return text.substring(0, maxLength);
}

String formatDateTab(String date) {
  // Parse the date string into a DateTime object
  final dateTime = DateTime.parse(date);

  // Format the date as "Day X: Weekday Day Month"
  final weekday = DateFormat('EEEE').format(dateTime);
  final day = DateFormat('d').format(dateTime);
  final month = DateFormat('MMM').format(dateTime);

  // Return formatted string
  return '$weekday $day $month';
}

String getCurrentDate() {
  DateTime now = DateTime.now();
  return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now.toUtc());
}

String getCurrentDayDate({String separator = '-', bool reverse = false}) {
  if (reverse) {
    return DateFormat('yyyy${separator}MM${separator}dd')
        .format(DateTime.now());
  } else {
    return DateFormat('dd${separator}MM${separator}yyyy')
        .format(DateTime.now());
  }
}

String formatDateOutput(DateTime datevalue, {bool outputDob = false}) {
  if (outputDob) {
    String formattedDate =
        "${datevalue.year}${datevalue.month.toString().padLeft(2, '0')}${datevalue.day.toString().padLeft(2, '0')}";
    return '${formattedDate}000000';
  } else {
    String formattedDate =
        "${datevalue.day.toString().padLeft(2, '0')}/${datevalue.month.toString().padLeft(2, '0')}/${datevalue.year}";
    return formattedDate;
  }
}

String filesDateTimeStamp() {
  return DateFormat('yyyyMMdd-HHmmss').format(DateTime.now());
}

int timeStamp() {
  return DateTime.timestamp().millisecondsSinceEpoch;
}

String humanReadableDate(String dateString) {
  int year = int.parse(dateString.substring(0, 4));
  int month = int.parse(dateString.substring(4, 6));
  int day = int.parse(dateString.substring(6, 8));
  int hour = int.parse(dateString.substring(8, 10));
  int minute = int.parse(dateString.substring(10, 12));
  int second = int.parse(dateString.substring(12, 14));

  // Create a DateTime object
  DateTime date = DateTime(year, month, day, hour, minute, second);
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}

String formatDatePendingApplication(String inputDate) {
  String year = inputDate.substring(0, 4);
  String month = inputDate.substring(4, 6);
  String day = inputDate.substring(6, 8);

  // Construct a DateTime object
  DateTime dateTime =
      DateTime(int.parse(year), int.parse(month), int.parse(day));

  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

  return formattedDate;
}

String dateToString(DateTime dateValue) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateValue);
}

String dateFormatter(String date) {
  String day = date.substring(6, 8);
  String month = date.substring(4, 6);
  String year = date.substring(0, 4);
  switch (month) {
    case 'O1':
      month = 'Jan';
    case 'O2':
      month = 'Feb';
    case '03':
      month = 'Mar';
    case '04':
      month = 'Apr';
    case '05':
      month = 'May';
    case '06':
      month = 'Jun';
    case '07':
      month = 'Jul';
    case '08':
      month = 'Aug';
    case '09':
      month = 'Sep';
    case '10':
      month = 'Oct';
    case '11':
      month = 'Nov';
    case '12':
      month = 'Dec';
    default:
      month = DateFormat('MMM').format(DateTime.now());
  }
  return '$day-$month-$year';
}

String dateFormatterV2(String date) {
  var dates = date.split('-');
  String month = '';
  switch (dates[1]) {
    case '01':
      month = 'Jan';
    case 'O2':
      month = 'Feb';
    case '03':
      month = 'Mar';
    case '04':
      month = 'Apr';
    case '05':
      month = 'May';
    case '06':
      month = 'Jun';
    case '07':
      month = 'Jul';
    case '08':
      month = 'Aug';
    case '09':
      month = 'Sep';
    case '10':
      month = 'Oct';
    case '11':
      month = 'Nov';
    case '12':
      month = 'Dec';
    default:
      month = DateFormat('MMM').format(DateTime.now());
  }
  return '${dates[2]}-$month-${dates[0]}';
}

String dateFormatterQuotation(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  return DateFormat('dd-MMM-yyyy').format(date);
}

List<String> getAllMonths() {
  return [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
}

String mapMonthToMonthNo(int year, String month) {
  // Define a map to map month names to their numerical representations.
  final months = {
    'Jan': '01',
    'Feb': '02',
    'Mar': '03',
    'Apr': '04',
    'May': '05',
    'Jun': '06',
    'Jul': '07',
    'Aug': '08',
    'Sep': '09',
    'Oct': '10',
    'Nov': '11',
    'Dec': '12',
  };

  // Check if the provided month is valid.
  if (!months.containsKey(month)) {
    throw ArgumentError('Invalid month: $month');
  }

  // Format the date and time.
  final formattedDate = '01/${months[month]}/$year 00:00:00';

  return formattedDate;
}

List<String> getAllYears() {
  int currentYear = DateTime.now().year;
  List<String> years = [];

  for (int i = 0; i < 4; i++) {
    years.add((currentYear - i).toString());
  }

  return years;
}

List<String> getAllYearsUntil2022() {
  int currentYear = DateTime.now().year;
  List<String> years = [];

  for (int year = currentYear; year >= 2022; year--) {
    years.add(year.toString());
  }

  return years;
}

List<String> getAllProductCategories() {
  return ['Retail Life', 'Unit Linked', 'Personal Accident'];
}

List<String> getReportType() {
  return ['New Business'];
}

/// A date utility interface to get every information of dates, months, weeks and year taking leap
/// year into consideration.
class DateUtil {
  DateUtil._();

  var dayOfWeek = 0;
  int yearLength(int year) {
    var yearLength = 0;
    for (int counter = 1; counter < year; counter++) {
      if (counter >= 4) {
        if (leapYear(counter) == true) {
          yearLength += 366;
        } else {
          yearLength += 365;
        }
      } else {
        yearLength += 365;
      }
    }
    return yearLength;
  }

  String? day(int length) {
    final day = <String>[
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ];

    var count = 0;
    String? resultDay;

    for (var counter = 1; counter <= length; counter++) {
      final check = ((counter > 639798) && (counter < 639811));
      if (check == true) {
      } else {
        if (count >= 7) {
          if (count % 7 == 0) count = 0;
        }
        resultDay = day[count];
        count++;
      }
    }
    if (count == 1) {
      dayOfWeek = 7;
    } else {
      dayOfWeek = (count - 1);
    }
    return resultDay;
  }

  String month(final int monthNum) {
    final month = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return month[monthNum - 1];
  }

  static String getMonthInitial(String month) {
    switch (month) {
      case '01':
        month = 'Jan';
      case 'O2':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'Jun';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
    }
    return month;
  }

  int? daysInMonth(final int monthNum, final int year) {
    if (monthNum > 12) {
      return null;
    }
    List<int> monthLength = List.filled(12, 0);
    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  int daysPastInYear(final int monthNum, final int dayNum, final int year) {
    var totalMonthLength = 0;
    for (var count = 1; count < monthNum; count++) {
      totalMonthLength += daysInMonth(count, year)!;
    }
    return totalMonthLength + dayNum;
  }

  int totalLengthOfDays(final int monthNum, final int dayNum, final int year) =>
      daysPastInYear(monthNum, dayNum, year) + yearLength(year);

  void printMonthCalendar(final int monthNum, final int year) {
    int dayNum = 1;
    final strDay = <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'];
    int dayDays = 1;

    for (int i = 0; i < 7; i++) {
      stdout.write('${strDay[i]}\t');
    }
    stdout.writeln();
    for (int i = 1; i <= 6; i++) {
      for (int j = 1; j <= 7; j++) {
        if (dayNum >= dayOfWeek) {
          if (dayDays <= daysInMonth(monthNum, year)!) {
            stdout.write('$dayDays\t');
          }
          ++dayDays;
        } else if (dayNum < dayOfWeek) {
          stdout.write('\t');
        }

        dayNum++;
      }
      stdout.writeln();
    }
  }

  int getWeek(int monthNum, int dayNum, int year) {
    double a = (daysPastInYear(monthNum, dayNum, year) / 7) + 1;
    return a.toInt();
  }

  static String theTimeNow() {
    DateTime now = DateTime.now();
    return DateFormat('HHmmss').format(now);
  }

  bool leapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  static String getMonthName(String month) {
    switch (month) {
      case '01':
        return 'Jan';
      case '02':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'July';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
      default:
        return DateFormat('MMM').format(DateTime.now());
    }
  }

  static String getMonthNumber(String month) {
    switch (month) {
      case 'Jan':
        return '01';
      case 'Feb':
        return '02';
      case 'Mar':
        return '03';
      case 'Apr':
        return '04';
      case 'May':
        return '05';
      case 'Jun':
        return '06';
      case 'Jul':
        return '07';
      case 'Aug':
        return '08';
      case 'Sep':
        return '09';
      case 'Oct':
        return '10';
      case 'Nov':
        return '11';
      case 'Dec':
        return '12';
      default:
        return DateFormat('MM').format(DateTime.now());
    }
  }

  static String getFromDate(month, year) {
    String monthNumber = getMonthNumber(month);
    DateTime today = DateTime.now();
    return month == ''
        ? '${today.year}-0${today.month}-00T00:00:00'
        : '$year-$monthNumber-01T00:00:00';
  }

  static String getToDate(month, year) {
    List<String> thirtyDayMonths = ['Apr', 'Jun', 'Sep', 'Nov'];
    List<String> thirtyOneDayMonths = [
      'Jan',
      'Mar',
      'May',
      'Jul',
      'Aug',
      'Oct',
      'Dec'
    ];
    String monthNumber = getMonthNumber(month);
    if (thirtyDayMonths.contains(month)) {
      return '$year-$monthNumber-30T23:59:59';
    } else if (thirtyOneDayMonths.contains(month)) {
      return '$year-$monthNumber-31T23:59:59';
    } else if (month == 'Feb') {
      bool isLeapYear(int year) {
        return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
      }

      return isLeapYear(int.parse(year))
          ? '$year-$monthNumber-29T23:59:59'
          : '$year-$monthNumber-28T23:59:59';
    } else {
      DateTime today = DateTime.now();
      return '${today.year}-0${today.month}-${today.day}T23:59:59';
    }
  }

  ///Format: 1 2023 Calendar Month
  static String getPayslipDate(month, year) {
    int monthNo = int.parse(getMonthNumber(month));
    return '$monthNo $year Calendar Month';
  }

  static String kenyaDateFormat(String inputDate) {
    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('dd-MM-yyyy');
    final date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }

  static String getTodayDate() {
    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    final formattedDate = DateFormat('dd-MMM-yyyy').format(todayDate);
    return formattedDate;
  }

  static String getFirstDayOfCurrentYear() {
    final now = DateTime.now();
    final firstDayOfYear = DateTime(now.year, 1, 1);
    final formattedDate = DateFormat('dd-MMM-yyyy').format(firstDayOfYear);
    return formattedDate;
  }

  static List<String> getAllYears({
    int forwardOffset = 4,
    int backwardOffset = 4,
  }) {
    int currentYear = DateTime.now().year;
    List<String> years = [];

    final from = currentYear - backwardOffset;
    final to = currentYear + forwardOffset;

    for (var i = from; i <= to; i++) {
      years.add(i.toString());
    }

    return years;
  }
}
