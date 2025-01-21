# SwahiLib - Kamusi ya Kiswahili
The Kamusi ya Kiswahili app has been rebranded to SwahiLib. If you are looking for the old app you can find it in the [old-app branch](https://github.com/oyonde/SwahiLib/tree/old-app)


<a href='https://play.google.com/store/apps/details?id=com.swahilib'>
  <img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width='200'/>
</a>


## Plugins used
- dependency injection (injectable/get it)
- network layer (dio)
- network logging (niddler, dio)
- viewmodels (provider)
- translations (icapps translations)
- json serialization (json_serializable)
- different environments
- themes
- navigator
- linting (flutter analyze)

## Getting Started

Follow this guide to set up and run the SwahiLib App:

### Setting Up the App:

1. **Install Flutter and Dependencies:** Ensure Flutter is installed on your system. Download the Flutter SDK from the official website and set up your preferred IDE (e.g., Android Studio or Visual Studio Code) with the Flutter plugin.

2. **Clone the Repository:** Clone the SwahiLib App repository from GitHub using Git:

    ```bash
    git clone https://github.com/SiroDaves/SwahiLib.git
    ```

3. **Install Packages:** Navigate to the project directory and run:

    ```bash
    flutter pub get
    ```

### Running the SwahiLib App:

1. **Device Setup:** Connect an emulator or physical device to your development environment. Check connected devices:

    ```bash
    flutter devices
    ```

2. **Run the App:** Execute the following command from the project directory:

    ```bash
    flutter run --dart-define-from-file keys-prod.json
    ```

    - **Update Code generation files:**

        ```bash
        dart run build_runner build --delete-conflicting-outputs
        ```

    - **Update Localization Strings:**

        ```bash
        flutter gen-l10n
        ```

3. **Build the App:**

    - **AppTester Develop Version (Firebase Distribution):**

        ```bash
        flutter build apk --flavor apptester -t lib/main_dev.dart --dart-define-from-file keys-prod.json --no-tree-shake-icons
        ```

    - **AppTester Production Version (Firebase Distribution):**

        ```bash
        flutter build apk --flavor staging -t lib/main_stg.dart --dart-define-from-file keys-prod.json --no-tree-shake-icons
        ```

    - **Production (For Play Store):**

        ```bash
        flutter build appbundle --flavor prod -t lib/main_prod.dart --dart-define-from-file keys-prod.json --no-tree-shake-icons
        ```

    - **Production (For Apple App Store):**

        ```bash
        flutter build ios -t lib/main_prod.dart --dart-define-from-file keys-prod.json --no-tree-shake-icons --build-name {version-name}
        ```

Congratulations! You've successfully set up and run or built the SwahiLib App. Explore the codebase, make modifications, and contribute to creating a seamless experience for field agents in the insurance industry. Happy coding!