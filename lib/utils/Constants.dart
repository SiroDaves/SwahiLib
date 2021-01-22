//This file declares the strings used throughout the app

/// Shared Preference Keys for this app
class SharedPreferenceKeys {
  static const String AppDb_loaded = "app_database_loaded";
  static const String User = "app_user";
  static const String DarkMode = "app_dark_mode";
}

/// General language strings that are used throught the application majoryly in Kiswahili language
class LangStrings {
  static const String appName = "Kamusi Ya Kiswahili";
  static const String inProgress = "Inaendelea ...";
  static const String gettingReady = "Matayarisho ...";
  static const String somePatience = "Eish! ... Subiri kidogo ...";
  static const String words = 'maneno';
  static const String proverbs = 'methali';
  static const String sayings = 'misemo';
  static const String idioms = 'nahau';
  static const String searches = 'matafuto';
  static const String trivia = 'trivia';

  static const String campaign = "\n\n#KamusiYaKiswahili #KiswahiliKitukuzwe \n\nhttps://play.google.com/store/apps/details?id=com.kazibora.kamusi ";
  static const String synonyms_for = "\n\nVisawe (synonyms) vya neno ";
  static const String searchNow = "Tafuta ";
  static const String searchHint = "Tafuta Maneno ya Kiswahili";
  static const String favourited = "Maneno Uliyopenda";

  static const String wordsTable = 'words';
  static const String proverbsTable = 'proverbs';
  static const String sayingsTable = 'sayings';
  static const String idiomsTable = 'idioms';
  static const String searchesTable = 'searches';
  static const String triviaTable = 'trivia';

  static const String id = 'id';
  static const String wordid = 'wordid';
  static const String wordids = 'wordids';
  static const String triviaid = 'triviaid';
  static const String categoryid = 'categoryid';
  static const String created = 'created';
  static const String title = 'title';
  static const String meaning = 'meaning';
  static const String synonyms = 'synonyms';
  static const String conjugation = 'conjugation';
  static const String isfav = 'isfav';
  static const String views = 'views';
  static const String notes = 'notes';

  static const String time = 'time';
  static const String category = 'category';
  static const String level = 'level';
  static const String questions = 'questions';
  static const String score = 'score';

  static const String nothing = 'Ala! Yaani hivi kumbe hamna chochote huku!\nHebu fanya jambo ...';

  static const String copyThis = "Nakili kwa Clipboard";
  static const String shareThis = "Shiriki";

  static const String wordCopied = "Word limenakiliwa kwa clipboard!";
  static const String wordLiked = " imependwa!";
  static const String wordDisliked = " haijapendwa!";

  static const String mandhariMeusi = "Mandhari Meusi";

  static const String donateActionButton = "CHANGIA";
  static const String laterActionButton = "BAADAYE";
  
  static String donateDialogTitle = "CHANGIA SASA";
  static const String donateDialogMessage = "Kamusi ya Kiswahili ni kitumizi cha bure cha kuwezesha watumizi kama wewe waelimike na kufuzu katika lugha ya Kiswahili." +
    " Sisi ni shirika lisilo la faida na tunategemea watu kama wewe kutusaidia kuweka Kamusi bure bila ya matangazo ya kibiashara kwa mamilioni ya watu ulimwenguni";

  static const String donateTabPage = "Tuunge Mkono kwa Mchango";

  static const String donateTab1Title = "M-Pesa";
  static const String donateTab1Content = "PAYBILL: 891300\n\nAKAUNTI: 34489";

  static const String donateTab2Title = "Equitel";
  static const String donateTab2Content = "NAMBARI YA BIASHARA:\n\t891300\n\nAKAUNTI: 34489";

  static const String donateTab3Title = "Airtel";
  static const String donateTab3Content =
      "JINA LA BIASHARA:\n\tMCHANGA\n\nAKAUNTI: 34489";

  static const String donateTab4Title = "PayPal";
  static const String donateTab4Content =
      "ANWANI:\n\ttunaboresha [at] gmail.com";

  static const String helpTabPage = "Usaidizi na Mawasiliano";

  static const String helpTab1Title = "Wasiliana";
  static const String helpTab1Content =
      "<p>SIMU: +2547 - </p><hr><p>BARUA PEPE: tunaboresha [at] gmail.com </p><hr> <p>TOVUTI: <a href=\"https://kazibora.github.io\">kazibora.github.io</a></p>";

  static const String helpTab2Title = "Reviews";
  static const String helpTab2Content =
      "Iwapo unafurahia kitumizi (app) chetu au haufurahii tafadhali tujulishe kwa kuacha review yako kwenye <a href=\"https://play.google.com/store/apps/details?id=com.kazibora.kamusi\">Google Play Store</a>";

  static const String helpTab3Title = "Open Source";
  static const String helpTab3Content =
      "Iwapo wewe ni Msanidi Kitumizi (App Developer), source code ya kitumizi hiki yapatikana bila malipo kwenye GitHub:</br></br> <a href=\"https://github.com/kazibora/kamusi\">github.com/kazibora/kamusi</a>";

      
  static const String howToUse = "Jinsi ya Kutumia Kitumizi";
  static const String howToSearch1 = "Kutafuta words";
  static const String howToSearch2 = "Guza sehemu nyeupe iliyoonyeshwa kwa mstari mwekundu ili kufungua skrini ya kutafuta words. " +
  "Tafadhali zingatia kuwa utafutaji ni wa words pekee";
  static const String aboutApp = "Kuhusu Kitumizi";

  static const String favoritesTab = "Vipendwa";
  static const String searchTab = "Tafuta";
  static const String triviaTab = "TriviaScreen";

  static const String triviaPage = "Chemsha Bongo";
  static const String triviaPageInstruction = "Chagua kundi ili kuanza";
  static const String triviaQuizInstruction = "Chagua Idadi ya Maswali";
  static const String triviaLevelInstruction = "Chagua Kiwango cha Ugumu";
  static const String triviaStart = "Anza!";
  static const String triviaCategory = "Kundi: ";
  static const String triviaEasy = "Rahisi";
  static const String triviaMedium = "Wastani";
  static const String triviaHard = "Ngumu";
}

/// Strings used in the database queries
class Queries {
  /// Query string for creating the words table
  static const String createWordsTable = 'CREATE TABLE ' + LangStrings.wordsTable +
    '(' + 
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.meaning + ' VARCHAR(300), ' +
      LangStrings.synonyms + ' VARCHAR(100), ' +
      LangStrings.conjugation + ' VARCHAR(100),' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the proverbs table
  static const String createProverbsTable = 'CREATE TABLE ' + LangStrings.proverbsTable +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.meaning + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the sayings table
  static const String createSayingsTable = 'CREATE TABLE ' + LangStrings.sayingsTable +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.meaning + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the idioms table
  static const String createIdiomsTable = 'CREATE TABLE ' + LangStrings.idiomsTable +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.meaning + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';
    
  /// Query string for creating the searches table
  static const String createSearchesTable = 'CREATE TABLE ' + LangStrings.searchesTable +
    '(' + 
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.wordid + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.created + ' VARCHAR(20)' +
    ');';
 
  /// Query string for creating the trivia table
  static const String createTriviaTable = 'CREATE TABLE ' + LangStrings.triviaTable +
    '(' + 
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.triviaid + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.category + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.questions + ' VARCHAR(200), ' +
      LangStrings.level + ' VARCHAR(200), ' +
      LangStrings.score + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.time + ' VARCHAR(20), ' +
      LangStrings.created + ' VARCHAR(20)' +
    ');';


}
