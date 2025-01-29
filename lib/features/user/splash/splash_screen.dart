import 'package:flutter/material.dart';

import '../../../common/utils/constants/app_constants.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../core/theme/theme_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bgColorBW(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(AppAssets.appIcon, height: 200, width: 200),
            const SizedBox(height: 10),
            const Text(
              AppConstants.appTitle,
              style: TextStyle(
                fontSize: 50,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: ThemeColors.primary,
              ),
            ),
            const SizedBox(height: 5),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                  color: ThemeColors.primaryDark, thickness: 2, height: 50),
            ),
            const Text(
              AppConstants.appTagline,
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: ThemeColors.primary,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
