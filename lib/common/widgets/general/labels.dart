import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';

class TagView extends StatelessWidget {
  final String tagText;
  final double size;

  const TagView({super.key, required this.tagText, required this.size});

  @override
  Widget build(BuildContext context) {
    try {
      if (tagText.isNotEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: 5),
          decoration: const BoxDecoration(
            color: ThemeColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [BoxShadow(blurRadius: 1)],
          ),
          child: Text(
            tagText,
            style: TextStyle(
              fontSize: size * 0.8,
              color: Colors.white,
            ),
          ),
        );
      } else {
        return Container();
      }
    } on Exception {
      return Container();
    }
  }
}
