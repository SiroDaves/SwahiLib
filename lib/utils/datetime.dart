/// Helper functions for DateTime objects.

import 'package:flutter/material.dart';

typedef DateTimePredicate = bool Function(DateTime);

class DateTimeUtil {
  DateTime _now;
  DateTime _todayMidnight;
  DateTime _yesterdayMidnight;
  DateTime _firstDayOfWeekMidnight;
  DateTime _firstDayOfLastWeekMidnight;
  DateTime _firstDayOfMonthMidnight;
  DateTime _firstDayOfLastMonthMidnight;

  DateTimeUtil(BuildContext context) {
    _now = DateTime.now();

    // This is 0 for Monday, 5 for Saturday and 6 for Sunday.
    final firstDayOfWeekIndex =
        MaterialLocalizations.of(context).firstDayOfWeekIndex;

    // This is in the local timezone.
    _todayMidnight = DateTime(_now.year, _now.month, _now.day);

    _yesterdayMidnight = _todayMidnight.subtract(Duration(days: 1));

    // now.weekday is 1 for Monday, 7 for Sunday.
    _firstDayOfWeekMidnight = _todayMidnight
        .subtract(Duration(days: (_now.weekday - firstDayOfWeekIndex) % 7 - 1));

    _firstDayOfLastWeekMidnight =
        _firstDayOfWeekMidnight.subtract(Duration(days: 7));

    _firstDayOfMonthMidnight = DateTime(_now.year, _now.month);

    _firstDayOfLastMonthMidnight = _now.month == 1
        ? DateTime(_now.year - 1, 12)
        : DateTime(_now.year, _now.month - 1);
  }

  bool isToday(DateTime a) {
    return a.isAfter(_todayMidnight);
  }

  bool isYesterday(DateTime a) {
    return !isToday(a) && a.isAfter(_yesterdayMidnight);
  }

  bool isEarlierThisWeek(DateTime a) {
    return !isToday(a) && !isYesterday(a) && a.isAfter(_firstDayOfWeekMidnight);
  }

  bool isLastWeek(DateTime a) {
    return !isToday(a) &&
        !isYesterday(a) &&
        !isEarlierThisWeek(a) &&
        a.isAfter(_firstDayOfLastWeekMidnight);
  }

  bool isEarlierThisMonth(DateTime a) {
    return !isToday(a) &&
        !isYesterday(a) &&
        !isEarlierThisWeek(a) &&
        !isLastWeek(a) &&
        a.isAfter(_firstDayOfMonthMidnight);
  }

  bool isLastMonth(DateTime a) {
    return !isToday(a) &&
        !isYesterday(a) &&
        !isEarlierThisWeek(a) &&
        !isLastWeek(a) &&
        !isEarlierThisMonth(a) &&
        a.isAfter(_firstDayOfLastMonthMidnight);
  }

  bool isBeforeLastMonth(DateTime a) {
    return a.isBefore(_firstDayOfLastMonthMidnight);
  }
}
