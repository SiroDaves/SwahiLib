class ApiConstants {
  static const String octetStream = "application/octet-stream";
  static const String baseUrl = "http://kamusi.appsmata.com/";
  //static const String baseUrl = "http://192.168.43.16/kamusi-web/public/";
}

class ApiStrings {  
  static const String areYouConnected = "Je, umeunganishwa?";
  static const String noConnection = "Hauna Mwungano wa Mtandao";
  static const String noInternetConnection = "Masalale! Hili linavunja moyo sana. Huonekani kuwa na mwungano imara wa mtandao.\n\n" +
          "Tafadhali jiunge na mtandao imara kupitia kwa Wi-Fi or Data ya Simu halafu jaribu tena.";
}

class ApiOperations {
  static const String success = "success";
  static const String failure = "failure";
  static const String suspended = "suspended";
  static const String unpermited = "unpermited";
  static const String missing = "missing";
  static const String invalid = "invalid";
  static const String already = "already";

  static const String login = "login";
  static const String register = "register";
  static const String changePassword = "chgpass";

  static const String categories = "api/categories";
  static const String trivia = "api/trivia";
}

class EventConstants {
  static const int noInternetConnection = 0;

  static const int requestSuccessful = 300;
  static const int requestUnsuccessful = 301;
  static const int requestNotFound = 302;
  static const int requestSuspended = 303;
  static const int requestUnpermited = 304;
  static const int requestInvalid = 305;

  static const int userSigninSuccessful = 500;
  static const int userSigninUnsuccessful = 501;
  static const int userNotFound = 502;
  static const int userSignupSuccessful = 503;
  static const int userSignupUnsuccessful = 504;
  static const int userAlreadyRegistered = 505;
  static const int signupSuspended = 506;
  static const int signupUnpermited = 507;
  static const int changePasswordSuccessful = 508;
  static const int changePasswordUnsuccessful = 509;
  static const int invalidOldPassword = 510;
}

class ApiResponseCode {
  static const int scOK = 200;
}
