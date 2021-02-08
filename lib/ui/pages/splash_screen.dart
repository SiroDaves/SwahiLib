// This file declares splash screen

import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/app_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: ColorUtils.white,
      child: Center(child: Image.asset(AppStrings.appIcon, height: 64, width: 64)),
    );
  }
}
