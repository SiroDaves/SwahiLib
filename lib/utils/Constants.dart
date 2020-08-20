
class SharedPreferenceKeys {
  static const String Kamusidb_Loaded = "kamusi_database_loaded";
  static const String User = "kamusi_user";
  static const String DarkMode = "kamusi_dark_mode";
}

class AsProgressDialogTitles {
  static const String inProgress = "Inaendelea ...";
  static const String gettingReady = "Matayarisho ...";
  static const String somePatience = "Eish! ... Subiri kidogo ...";
}

class Texts {
  static const String appName = "Kamusi Ya Kiswahili";
  static const String searchNow = "Tafuta ";
  static const String maneno = 'maneno';
  static const String methali = 'methali';
  static const String misemo = 'misemo';
  static const String nahau = 'nahau';
}

class Tooltips {
  static const String copyNeno = "Copy to Clipboard";
  static const String shareNeno = "Share this";
}

class SnackBarText {
  static const String noInternetConnection = "No internet connection";
  static const String nenoCopied = "Neno copied to clipboard!";
  static const String nenoLiked = " liked!";
  static const String nenoDisliked = " disliked!";
}

class Columns {
  static const String id = 'id';
  static const String title = 'title';
  static const String maana = 'maana';
  static const String visawe = 'visawe';
  static const String mnyambuliko = 'mnyambuliko';
  static const String isfav = 'isfav';
  static const String views = 'views';
  static const String notes = 'notes';
}

class Queries {
  static const String createManenoTable = 'CREATE TABLE ' + Texts.maneno +
      '(' + 
        Columns.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
        Columns.title + ' VARCHAR(100), ' +
        Columns.maana + ' VARCHAR(300), ' +
        Columns.visawe + ' VARCHAR(100), ' +
        Columns.mnyambuliko + ' VARCHAR(100),' +
        Columns.notes + ' VARCHAR(500), ' +
        Columns.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
        Columns.views + ' INTEGER NOT NULL DEFAULT 0' +
    ");";

   static const String createMethaliTable = 'CREATE TABLE ' + Texts.methali +
      '(' + 
        Columns.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
        Columns.title + ' VARCHAR(100), ' +
        Columns.maana + ' VARCHAR(500), ' +
        Columns.notes + ' VARCHAR(500), ' +
        Columns.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
        Columns.views + ' INTEGER NOT NULL DEFAULT 0' +
    ");";
   
   static const String createMisemoTable = 'CREATE TABLE ' + Texts.misemo +
      '(' + 
        Columns.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
        Columns.title + ' VARCHAR(100), ' +
        Columns.maana + ' VARCHAR(500), ' +
        Columns.notes + ' VARCHAR(500), ' +
        Columns.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
        Columns.views + ' INTEGER NOT NULL DEFAULT 0' +
    ");";
   
   static const String createNahauTable = 'CREATE TABLE ' + Texts.nahau +
      '(' + 
        Columns.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
        Columns.title + ' VARCHAR(100), ' +
        Columns.maana + ' VARCHAR(500), ' +
        Columns.notes + ' VARCHAR(500), ' +
        Columns.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
        Columns.views + ' INTEGER NOT NULL DEFAULT 0' +
    ");";

}
