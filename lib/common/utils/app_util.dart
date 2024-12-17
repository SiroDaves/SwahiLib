import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as logging show log;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

bool isDesktop = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
bool isMobile = Platform.isAndroid || Platform.isIOS || Platform.isFuchsia;

void logger(String message) {
  return logging.log('''
$message
  ''');
}

String getThemeModeString(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return 'Light';

    case ThemeMode.dark:
      return 'Dark';

    default:
      return 'System Theme';
  }
}

/// Function to update a dropdown value by checking if the new value exists in the current list of values in the dropdown
dynamic updateValue(dynamic newValue, List<dynamic> values) {
  if (values.contains(newValue)) {
    return newValue;
  } else {
    return values[0];
  }
}

/// Filter out unwanted characters
String? filterString(String input) {
  RegExp regex = RegExp(r': (.+?) :');
  RegExpMatch? match = regex.firstMatch(input);
  if (match != null && match.groupCount >= 1) {
    return match.group(1);
  }
  return input; // Return original string if no match found
}

String feedbackMessage(String code, AppLocalizations tr) {
  switch (code) {
    case '0':
      return tr.labelError0;
    case '404':
      return tr.labelError404;
    case '500':
      return tr.labelError500;
    case '504':
      return tr.labelError504;
    case '999':
      return tr.labelError999;
    case '1000':
      return tr.labelError1000;
    default:
      return code;
  }
}

String emptyStateMessage(String code, AppLocalizations tr) {
  switch (code) {
    case '0':
      return tr.labelFeedback0;
    case '404':
      return tr.labelFeedback404;
    case '500':
      return tr.labelFeedback500;
    case '504':
      return tr.labelFeedback504;
    case '999':
      return tr.labelFeedback999;
    case '1000':
      return tr.labelFeedback1000;
    default:
      return code;
  }
}

dynamic tryJsonDecode(String source) {
  try {
    return jsonDecode(source);
  } catch (e) {
    return null;
  }
}

Future<bool> isKeyboardShowing(BuildContext context) async {
  // ignore: unnecessary_null_comparison
  if (WidgetsBinding.instance != null) {
    return View.of(context).viewInsets.bottom > 0;
  } else {
    return false;
  }
}

Future<void> closeKeyboard(BuildContext context) async {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

String? textValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field is required';
  }
  return null;
}

bool isNumeric(String s) {
  // ignore: unnecessary_null_comparison
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

extension StringExtension on String {
  String camelCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase().replaceAll('_', '')}";
  }
}

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

List<String> generateDropDownItems({
  String initial = '',
  int? lowerLimit,
  int? upperLimit,
  bool incremental = true,
  int minLength = 2,
}) {
  List<String> temp = [], items = [];
  temp.add(initial);
  if (incremental) {
    for (int i = lowerLimit!; i < upperLimit! + 1; i++) {
      temp.add(i.toString());
    }
  } else {
    for (int i = upperLimit!; i > lowerLimit! - 1; i--) {
      temp.add(i.toString());
    }
  }
  for (var item in temp) {
    if (item.length < minLength) {
      items.add('0$item');
    } else {
      items.add(item);
    }
  }
  return items;
}

String capitalize(String? str) {
  if (str == null || str.isEmpty) {
    return ''; // Return an empty string if the input is null or empty
  }
  return str.substring(0, 1).toUpperCase() + str.substring(1);
}

String truncateString(int cutoff, String myString) {
  var words = myString.split(' ');
  try {
    if (myString.length > cutoff) {
      if ((myString.length - words[words.length - 1].length) < cutoff) {
        return myString.replaceAll(words[words.length - 1], '');
      } else {
        return (myString.length <= cutoff)
            ? myString
            : myString.substring(0, cutoff);
      }
    } else {
      return myString.trim();
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
    return myString.trim();
  }
}

String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
}
