import 'package:flutter/material.dart';

import '../../utils/env/flavor_config.dart';

class TextScaleFactor extends StatelessWidget {
  final Widget child;

  const TextScaleFactor({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    FlavorConfig.instance.devicePixelRatio = mediaQuery.devicePixelRatio;
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1)),
      child: child,
    );
  }
}
