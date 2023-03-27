import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateNow() {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
}

String dateToString(DateTime dateValue) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateValue);
}

Future<bool> isKeyboardShowing() async {
  // ignore: unnecessary_null_comparison
  if (WidgetsBinding.instance != null) {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
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

String refineTitle(String textTitle) {
  return textTitle.replaceAll("''", "'");
}

String refineContent(String contentText) {
  return contentText.replaceAll("''", "'").replaceAll("#", " ");
}

String songItemTitle(int number, String title) {
  if (number != 0) {
    return "$number. ${refineTitle(title)}";
  } else {
    return refineTitle(title);
  }
}

List<String> songVerses(String songContent) {
  List<String> verseList = [];
  var verses = songContent.split("##");

  for (final verse in verses) {
    verseList.add(verse.replaceAll("#", "\n"));
  }
  return verseList;
}

String songCopyString(String title, String content) {
  return "$title\n\n$content";
}

String bookCountString(String title, int count) {
  return '$title ($count)';
}

String lyricsString(String lyrics) {
  return lyrics.replaceAll("#", "\n").replaceAll("''", "'");
}

String songViewerTitle(int number, String title, String alias) {
  String songtitle = "$number. ${refineTitle(title)}";

  if (alias.length > 2 && title != alias) {
    songtitle = "$songtitle (${refineTitle(alias)})";
  }

  return songtitle;
}

String songShareString(String title, String content) {
  return "$title\n\n$content\n\nvia #vSongBook https://Appsmata.com/vSongBook";
}

String verseOfString(String number, int count) {
  return 'VERSE $number of $count';
}

double getFontSize(int characters, double height, double width) {
  return sqrt((height * width) / characters);
}
