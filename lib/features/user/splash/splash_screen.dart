import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../common/utils/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColors.bgColorBW(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(AppAssets.dcugIcon, height: 200, width: 200),
            const SizedBox(height: 10),
            Image.asset(AppAssets.droidconIcon, width: size.width - 150),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: ThemeColors.bgColorWB(context),
                thickness: 2,
                height: 50,
              ),
            ),
            Image.asset(AppAssets.hashtagIcon, width: size.width / 3),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
