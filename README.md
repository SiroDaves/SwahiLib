# SwahiLib - Kamusi ya Kiswahili
The Kamusi ya Kiswahili app has been rebranded to SwahiLib. If you are looking for the old app you can find it in the [old-app branch](https://github.com/oyonde/SwahiLib/tree/old-app)


<a href='https://play.google.com/store/apps/details?id=com.swahilib'>
  <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width='200'/>
</a>

<a href="https://apps.apple.com/us/app/id6446771678">
  <img alt='Get it on AppStore' src='https://developer.apple.com/app-store/marketing/guidelines/images/badge-example-preferred_2x.png' width='200'>
</a>

Swahilib - Kamusi ya Kiswahili for Android, iOS

## Getting Started

Follow this guide to set up and run the SwahiLib App:

## Getting Started

Follow this guide to set up and run SwahiLib:

### Setting Up SwahiLib:

1. **Install Flutter and Dependencies:** Ensure Flutter is installed on your system. Download the Flutter SDK from the official website and set up your preferred IDE (e.g., Android Studio or Visual Studio Code) with the Flutter plugin.

2. **Clone the Repository:** Clone SwahiLib repository from GitHub using Git:

    ```bash
    git clone git@github.com:SiroDaves/SwahiLibApp.git
    ```

3. **Install Packages:** Navigate to the project directory and run:

    ```bash
    flutter pub get
    ```

### Running SwahiLib:

1. **Device Setup:** Connect an emulator or physical device to your development environment. Check connected devices:

    ```bash
    flutter devices
    ```

2. **Update Dependencies:**

    ```bash
    flutter pub get
    ```

3. **Update Code Generated Files:**

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4. **Update Localization Strings:**

    ```bash
    flutter gen-l10n
    ```
5. **Running SwahiLib:**
    ```bash
    flutter run
    ```

### Building SwahiLib

1. **Android:**

    - **Production (For Play Store):**

        ```bash
        flutter build appbundle --dart-define-from-file keys-prod.json --no-tree-shake-icons
        ```
    
2. **iOS:**

    - **Production (For Play Store):**

        ```bash
        flutter build ipa --dart-define-from-file keys-prod.json --no-tree-shake-icons
        ```
    To upload to the App Store either:
    - Drag and drop the "build/ios/ipa/*.ipa" bundle into the Apple Transporter macOS app https://apps.apple.com/us/app/transporter/id1450874784
    - Run "xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey your_api_key --apiIssuer your_issuer_id".
       See "man altool" for details about how to authenticate with the App Store Connect API key.

---

Congratulations! You've successfully set up and run or built SwahiLib. Explore the codebase, make modifications, and contribute to creating a seamless experience for the users. Happy coding!