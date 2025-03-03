import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../app_util.dart';

class AppConstants {
  AppConstants._();
  static String dbName = 'SwahiLib.db';
  static const String historiesTable = 'histories';
  static const String idiomsTable = 'idioms';
  static const String proverbsTable = 'proverbs';
  static const String sayingsTable = 'sayings';
  static const String searchesTable = 'searches';
  static const String wordsTable = 'words';

  static const String bookmarksTable = 'bookmarks';
  static const String roomsTable = 'rooms';
  static const String speakersTable = 'speakers';
  static const String sessionsTable = 'sessions';
  static const String sessionsTableViews = 'viewsessions';

  static const appTitle = "SwahiLib";
  static const appTitle1 = "Kamusi ya Kiswahili";

  static Future<String> get databaseFile async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    if (isDesktop) {
      dbFolder = await getApplicationSupportDirectory();
    }

    var dbPath = join(dbFolder.path, AppConstants.dbName);
    logger('Opening database from: $dbPath');
    return dbPath;
  }

  static const appKamusi = "Kamusi ya Kiswahili";
  static const appTagline = "Kiswahili Kitukuzwe";

  static const String inProgress = "Inaendelea ...";
  static const String gettingReady = "Subiri kiasi ...";
  static const String somePatience = "Eish! ... Subiri kidogo ...";
  static const String words = 'maneno';
  static const String proverbs = 'methali';
  static const String sayings = 'misemo';
  static const String idioms = 'nahau';
  static const String searches = 'matafuto';
  static const String trivia = 'trivia';

  static const String campaign =
      "\n\n#KamusiYaKiswahili #KiswahiliKitukuzwe \n\nhttps://linktr.ee/SwahilibApp ";
  static const String synonyms = "\n\nVisawe (synonyms) vya neno ";
  static const String searchNow = "Tafuta ";
  static const String searchHint = "Tafuta Kwenye Kamusi";
  static const String favourited = "Maneno Uliyoyapenda";
  static const String history = "Historia yako";

  static const String nothing =
      'Ala! Yaani hivi kumbe hamna chochote huku!\nHebu fanya jambo ...';

  static const String copyThis = "Nakili kwa Clipboard";
  static const String shareThis = "Shiriki";

  static const String okayGotIt = "Sawa";
  static const String retry = "Jaribu Tena";

  static const String idiomCopied = "Nahau imenakiliwa kwa clipboard!";
  static const String sayingCopied = "Msemo umenakiliwa kwa clipboard!";
  static const String proverbCopied = "Methali imenakiliwa kwa clipboard!";
  static const String wordCopied = "Neno limenakiliwa kwa clipboard!";
  static const String wordLiked = " limependwa!";
  static const String wordDisliked = " limetolewa kwa vipendwa!";

  static const String darkMode = "Mandhari Meusi";

  static const filters = [words, idioms, sayings, proverbs];

  static List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'Y',
    'Z'
  ];
}
