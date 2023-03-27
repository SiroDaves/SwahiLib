// The translations for English (`en`).
class AppLocales {
  AppLocales._();

  static String get appTitle => "Abz";
  static String get appTagline => "The Gateway to your Child's Future";
  static String get appIntro =>
      "Let your children start learning from thousands of KICD approved learning materials including Instructor video, Audio, text and written text. Your children also get to take quizzes to help them gauge their learning progress";

  static String get adminPageHome => "Admin Home";
  static String get menuHome => "Home";
  static String get menuNotes => "Uploaded Notes";
  static String get menuStudents => "Students";
  static String get menuStudentsBulk => "Add Multiple Students";
  static String get menuTeachers => "Teachers";
  static String get menuTeachersBulk => "Add Multiple Teachers";
  static String get menuBilling => "Billing";
  static String get menuSettings => "Settings";

  static String get menuProfile => "Profile";
  static String get menuPassword => "Password";
  static String get menuProgress => "Progress";
  static String get menuPreference => "Preference";

  static String get wantToDelete => "Do you want to delete this?";
  static String get wantToDeleteNote =>
      "Are you sure you want to delete this note from the system?";
  static String get wantToDeleteStudent =>
      "Are you sure you want to delete this student from the system?";
  static String get wantToDeleteTeacher =>
      "Are you sure you want to delete this teacher from the system?";
  static String get actionNotReversable => "This action can not be undone!";

  static String get labelLogin => "Login";
  static String get labelSignup => "Signup";
  static String get labelAlreadyHaveAcc => "Already Have an Account?";
  static String get labelForgot => "Forgot Your Password?";
  static String get labelReset => "Reset Your Password";
  static String get labelSetupSchool => "Setup Your School";
  static String get labelContinue => "Continue";
  static String get labelGotoLessons => "Go to Lessons";
  static String get labelCancel => "Cancel";
  static String get labelTryAgain => "Try Again Later";
  static String get labelConfirmPayment => "Confirm Payment";
  static String get labelMakePayment => "Make Payment";
  static String get labelPayNow => "Pay Now";
  static String get labelProceed => "Proceed";
  static String get labelPaymentFailed => "Payment Failed";
  static String get labelPaymentSuccessful => "Payment was Successful";
  static String get labelPaymentChequeInitiated => "Cheque Payment was Initiated";
  static String get labelStartAddingStudents => "Start Adding Students";

  static String get labelUsername => "Username";
  static String get labelPassword => "Password";

  static String get labelInvalidInput => "Invalid Input";
  static String get labelInvalidInputText =>
      "Please fill all the fields with valid input";

  static String get labelSchoolDetails => "School Details";
  static String get labelAdminDetails => "Admin's Details";
  static String get labelName => "Name";
  static String get labelCounty => "County";
  static String get labelFullName => "Full Name";
  static String get labelEmailOptional => "Email Address (optional)";
  static String get labelPhoneOptional => "Phone Number (optional)";
  static String get labelHelpTopic => "Your Query in one sentence";
  static String get labelHelpTopicDetails => "Your Query in Details";
  static String get labelFirstName => "First Name";
  static String get labelLastName => "Last Name";
  static String get labelPhone => "Phone Number";
  static String get labelEmail => "Email Address";

  static String get subscriptionPlans => "Select Your Subscription Plan";
  static String get askForHelp => "Ask for Help";
  static String get mpesaInstruction =>
      "You will receive a prompt from MPESA on the mobile number you enter below";
  static String get chequeInstruction =>
      "We will contact you when we validate your Cheque Payment so that you can login to start using your subscription";
  static String get labelPhoneNumber => "Phone Number";

  static String get labelTakeQuiz => "Take Quiz";

  static String get labelProgressTitle => "Start Learning Today";
  static String get labelProgressSuggest => "Pick a Lesson";

  static String get labelCouldNotConnect =>
      "We couldn’t connect to the internet. Please check your connection.";
  static String get labelCouldNotAuthorize =>
      "We couldn’t authorize your account. Please make sure that you’ve completed the entire verification process.";

  static List<String> get studentDd => [
        'Add Students',
        'Add a Single Student',
        'Add Multiple Students',
        'Upload from CSV'
      ];
  static List<String> get teacherDd => [
        'Add Teachers',
        'Add a Single Teacher',
        'Add Multiple Teachers',
        'Upload from CSV'
      ];
  static List<String> get durationDd => ['Last 7 Days', 'Last 30 Days'];

  static List<String> get notesHeaders =>
      ['title', 'subject', 'class', 'file', 'created'];
  static List<String> get studentsHeaders => [
        'first name',
        'last name',
        'student no.',
      ];
  static List<String> get studentsTH => [
        'first name',
        'last name',
        'student no.',
        'password',
      ];
  static List<String> get teachersHeaders => [
        'first name',
        'last name',
        'phone',
        'email address',
      ];
  static List<String> get teachersTH => [
        'first name',
        'last name',
        'phone',
        'email',
        'password',
      ];
  static List<String> get billingHeaders => [
        'first name',
        'last name',
        'phone no',
        'method',
        'code',
        'amount',
        'subscription'
      ];

  static String get labelNewNotes => "Upload New Notes";
  static String get labelNewStudents => "Add a New Student";
  static String get labelNewTeachers => "Add a New Teacher";
  static String get labelSelectFile => "Select File";
  static String get labelSelectTemplate => "Select Template";
  static String get labelSelectPdfFile => "Select PDF File";
  static String get labelNoFileSelected => "No File Selected";

  static String get labelTitle => "Title";
  static String get labelTopic => "Topic";
  static String get labelSubmit => "Submit";

  static String get systemDefault => 'System Default';

  static String get darkLabel => 'Dark';

  static String get lightLabel => 'Light';

  static String get languageTitle => 'Language';

  static String get themeTitle => 'Theme';

  static String get databaseTitle => 'Database';

  static String get viewDatabase => 'View Database';

  static String get errorBadRequest => 'Bad request error';

  static String get errorDuringDev => 'You coded something wrong';

  static String get errorForbidden => 'Forbidden error';

  static String get errorGeneral => 'Something went wrong';

  static String errorGeneralWithCode(String code) {
    return 'Something went wrong (code: $code)';
  }

  static String get errorInternalServer => 'Internal server error';

  static String get errorNoNetwork => 'No internet connection available';

  static String get errorUnauthorized => 'Unauthorized error';

  static String get cancelLabel => 'Cancel';

  static String get deleteLabel => 'Delete';

  static String get noLabel => 'No';

  static String get okLabel => 'Ok';

  static String get saveLabel => 'Save';

  static String get yesLabel => 'Yes';

  static String get todoAddInputHint => 'Enter your Todo';

  static String get todoAddTitle => 'Add todo';

  static String get todoEmptyState =>
      'No data added to your database. Fetch some todos with an api call (download icon) or add one yourself by clicking the add icon.';

  static String get loginSuccess => 'Login was successful';
  static String get redirectingToPayment =>
      'Redirecting you to Payment, since you don\'t have an active subscription';
  static String get redirectingToAdmin => 'Redirecting you to Admin Panel';
  static String get redirectingToStudent => 'Redirecting you to Student Panel';
  static String get signupSuccess => 'Signup was successful';
  static String get subscriptionSuccess => 'Subscription created successful';
}
