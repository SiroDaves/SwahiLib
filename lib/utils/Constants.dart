//This file declares the strings used throughout the app

/// Shared Preference Keys for this app
class SharedPreferenceKeys {
  static const String Kamusidb_Loaded = "kamusi_database_loaded";
  static const String User = "kamusi_user";
  static const String DarkMode = "kamusi_dark_mode";
}

/// General language strings that are used throught the application majoryly in Kiswahili language
class LangStrings {
  static const String appName = "Kamusi Ya Kiswahili";
  static const String inProgress = "Inaendelea ...";
  static const String gettingReady = "Matayarisho ...";
  static const String somePatience = "Eish! ... Subiri kidogo ...";

  static const String campaign = "\n\n#KamusiYaKiswahili #KiswahiliKitukuzwe \n\nhttps://play.google.com/store/apps/details?id=com.kazibora.kamusi ";
  static const String visawe_vya = "\n\nVisawe (synonyms) vya neno ";
  static const String searchNow = "Tafuta ";
  static const String searchHint = "Tafuta Maneno ya Kiswahili";
  static const String favourited = "Maneno Uliyopenda";
  static const String maneno = 'maneno';
  static const String methali = 'methali';
  static const String misemo = 'misemo';
  static const String nahau = 'nahau';

  static const String id = 'id';
  static const String title = 'title';
  static const String maana = 'maana';
  static const String visawe = 'visawe';
  static const String mnyambuliko = 'mnyambuliko';
  static const String isfav = 'isfav';
  static const String views = 'views';
  static const String notes = 'notes';

  static const String nothing = 'Ala! Yaani hivi kumbe hamna chochote huku!\nHebu fanya jambo ...';

  static const String copyThis = "Nakili kwa Clipboard";
  static const String shareThis = "Shiriki";

  static const String nenoCopied = "Neno limenakiliwa kwa clipboard!";
  static const String nenoLiked = " imependwa!";
  static const String nenoDisliked = " haijapendwa!";

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
  static const String howToSearch1 = "Kutafuta maneno";
  static const String howToSearch2 = "Guza sehemu nyeupe iliyoonyeshwa kwa mstari mwekundu ili kufungua skrini ya kutafuta maneno. " +
  "Tafadhali zingatia kuwa utafutaji ni wa maneno pekee";
  static const String aboutApp = "Kuhusu Kitumizi";

  static const String favoritesTab = "Vipendwa";
  static const String searchTab = "Tafuta";
  static const String triviaTab = "Trivia";

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
  /// Query string for creating the maneno (words) table
  static const String createManenoTable = 'CREATE TABLE ' + LangStrings.maneno +
    '(' + 
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.maana + ' VARCHAR(300), ' +
      LangStrings.visawe + ' VARCHAR(100), ' +
      LangStrings.mnyambuliko + ' VARCHAR(100),' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the methali (proverbs) table
  static const String createMethaliTable = 'CREATE TABLE ' + LangStrings.methali +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.maana + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the misemo (sayings) table
  static const String createMisemoTable = 'CREATE TABLE ' + LangStrings.misemo +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.maana + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the nahau (phrases) table
  static const String createNahauTable = 'CREATE TABLE ' + LangStrings.nahau +
    '(' +
      LangStrings.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      LangStrings.title + ' VARCHAR(100), ' +
      LangStrings.maana + ' VARCHAR(500), ' +
      LangStrings.notes + ' VARCHAR(500), ' +
      LangStrings.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      LangStrings.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';
}
