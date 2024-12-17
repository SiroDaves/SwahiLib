import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_styles.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var rowWidget = Container(
        margin:
            const EdgeInsets.only(left: Sizes.m, right: Sizes.m, top: Sizes.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: Sizes.xs),
              height: 15,
              width: size.width - 120,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: Sizes.xs),
              height: 30,
              width: size.width - 50,
              color: Colors.black,
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: size.width / 6,
                  color: Colors.black,
                ),
                SizedBox(width: Sizes.xs),
                Container(
                  height: 10,
                  width: size.width / 6,
                  color: Colors.black,
                ),
                SizedBox(width: Sizes.xs),
                Container(
                  height: 10,
                  width: size.width / 5,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ));

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: rowWidget,
        items: 10,
        period: const Duration(seconds: 5),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
