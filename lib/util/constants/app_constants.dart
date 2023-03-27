import 'package:flutter/material.dart';

enum HomeList { list1, list2, list3, list4 }

class AppConstants {
  AppConstants._();

  static const playstoreLink =
      "https://play.google.com/store/apps/details?id=com.swahilib";
  static const tshirtOrderLink =
      "https://docs.google.com/forms/d/e/1FAIpQLSedRl841nlaniRCLm-I60VLL1tmHRC1Rd6j-eDNZZSNA8QzXQ/viewform?usp=sf_link";
  static const donationPaypalLink =
      "https://www.paypal.com/donate/?hosted_button_id=FYZYTW723Q8QC";
  static const donationPatreaonLink = "https://www.patreon.com/SongLib";

  static const appTitle = "SwahiLib";
  static const appKamusi = "Kamusi ya Kiswahili";
  static const appVersion = "v0.0.1.2";
  static const appTagline = "Kiswahili Kitukuzwe";
  static const listTitle = "Song Lists";
  static const searchTitle = "Song Search";
  static const likesTitle = "Liked Songs";
  static const historiesTitle = "Histories";
  static const draftTitle = "Song Drafts";
  static const settingsTitle = "App Settings";
  static const helpdeskTitle = "Help Desk";
  static const donateTitle = "How to Donate";
  static const merchandiseTitle = "Buy our Merchandise";
  static const booksTitle = "Select Song Books";
  static const booksTitleLoading = "Loading data ...";

  static const appIconPath = "assets/app_icon.png";

  static const homeTitle = "Home";
  static const listedTitle = "Adding a new list";
  static const editorTitle = "Drafting a new song";
  static const songTitle = "Your song in one line";
  static const songText = "The rest of your song";

  static const hasChorus = "With a Chorus";
  static const verses = "Verse";

  static const addtoList = "Add to a List";
  static const addSongtoList = "Add this song to a List";
  static const likeSong = "Like this song";
  static const editSong = "Edit this song";
  static const deleteSong = "Delete this song";
  static const copySong = "Copy this song";
  static const deleteList = "Delete this list";
  static const shareSong = "Share this song";
  static const songCopied = "song copied!";

  static const copyVerse = "Copy verse";
  static const textCopied = " copied!";
  static const shareVerse = "Share verse";
  static const songLiked = "song liked!";
  static const songAddedToList = "song added to a list!";
  static const listCreated = "song list created!";
  static const listUpdated = "song list updated!";
  static const deleted = "deleted!";
  static const readyShare = "Ready for sharing";
  static const screenshotVerse = "Screenshot verse";
  static const screenshoted = "We have your screenshot!";

  static const chooseTheme = "Choose Theme";
  static const themeDefault = "System Default";
  static const themeLight = "Light";
  static const themeDark = "Dark";

  static const okay = "OKAY";
  static const cancel = "CANCEL";
  static const remind = "REMIND ME LATER";
  static const donate = "DONATE NOW";
  static const proceed = "PROCEED";
  static const justAMinute = "Just a minute!";
  static const supportSonglib = "Support SongLib";
  static const notificationDialog = "Let's remind you";
  static const donationRequest = "Donation Request";
  static const donationRequestBody =
      "SongLib has a lot in the pipelines and will need your support to accomplish that.";
  static const doneSelecting = "Done with selecting?";
  static const doneSelectingBody =
      "If you are done selecting please proceed ahead. We can always bring you back here to reselect afresh.";
  static const noSelection = "Oops! No selection found";
  static const noSelectionBody =
      "Please select at least 1 book to proceed to the next step.";
  static const errorOccurred = "Wueh! You weren't supposed to see this!";
  static const errorOccurredBody1 =
      "An unexpected error occurred while trying to present the song to you. Please try again later or contact support";
  static const errorOccurredBody =
      "An unexpected error occurred while trying to fetch data from the server. Please try again later or contact support";
  static const noConnection = "No internet connection!";
  static const noConnectionBody =
      "If you have reliable internet connection, then our servers are down. It's one thing or the other, we can't tell which is which.";

  static const itsEmptyHere = "Wueh! It's empty here";
  static const itsEmptyHere1 = "Wueh! No lists here yet";
  static const itsEmptyHereBody =
      "All caught here, do a selection of songs once again";
  static const itsEmptyHereBody1 =
      "All caught here, please like a song, search or view a song or better still add a custom list to clear this emptiness here";
  static const itsEmptyHereBody2 =
      "All caught here, please add draft song to clear this emptiness here";
  static const itsEmptyHereBody3 =
      "All caught here, please like a song to clear this emptiness here";
  static const itsEmptyHereBody4 =
      "All caught here, you can add personal lists and add songs to them";

  static const getNotifycations = 'CheckForNewNotifications';

  static const remindAfter5hrs = 'RemindAfterFiveHours';
  static const remindAfter1Day = 'RemindAfterOneDay';
  static const remindAfter2Days = 'RemindAfterTwoDays';
  static const remindAfter5Days = 'RemindAfterFiveDays';
  static const remindAfter10Days = 'RemindAfterTenDays';

  static const songLibReminders = 'SongLibReminders';
  static const songLibRemindersN = 'SongLib Reminders';

  static const swahilibReminderNotificationTitle = 'SongLib needs your Support';
  static const swahilibReminderNotificationBody5Hrs =
      'Its 5 hours since you asked us to remind you to support us in the SongLib project';
  static const swahilibReminderNotificationBody1Day =
      'Its 1 day since you asked us to remind you to support us in the SongLib project';
  static const swahilibReminderNotificationBody2Days =
      'Its 2 days since you asked us to remind you to support us in the SongLib project';
  static const swahilibReminderNotificationBody5Days =
      'Its 5 days since you asked us to remind you to support us in the SongLib project';
  static const swahilibReminderNotificationBody10Days =
      'Its 10 days since you asked us to remind you to support us in the SongLib project';

  /// <i class="material-icons md-36">whatsapp</i> &#x2014; material icon named "whatsapp".
  static const IconData whatsapp =
      IconData(0xf05a6, fontFamily: 'MaterialIcons');
  static const String inProgress = "Inaendelea ...";
  static const String gettingReady = "Subiri kiasi ...";
  static const String somePatience = "Eish! ... Subiri kidogo ...";
  static const String words = 'maneno';
  static const String proverbs = 'methali';
  static const String sayings = 'misemo';
  static const String idioms = 'nahau';
  static const String searches = 'matafuto';
  static const String trivia = 'trivia';

  static const String revCatKey = 'danXhdPXSzsDcJgElNAexHaGnvsPMSqY';

  static const String campaign =
      "\n\n#KamusiYaKiswahili #KiswahiliKitukuzwe \n\nhttps://play.google.com/store/apps/details?id=com.kazibora.kamusi ";
  static const String synonyms_for = "\n\nVisawe (synonyms) vya neno ";
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

  static List<HomeList> homeLists = [
    HomeList.list1,
    HomeList.list2,
    HomeList.list3,
    HomeList.list4,
  ];
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
