import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../core/theme/theme_styles.dart';

class TagItem extends StatelessWidget {
  final String tagText;

  const TagItem({
    super.key,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    try {
      if (tagText.isNotEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: Sizes.xs),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? ThemeColors.primary
                : ThemeColors.kPrimaryDeepRed,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(tagText,
              style: TextStyles.headingStyle5.textColor(Colors.white)),
        );
      } else {
        return const SizedBox.shrink();
      }
    } on Exception {
      return const SizedBox.shrink();
    }
  }
}
