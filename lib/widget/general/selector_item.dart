import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/theme_colors.dart';
import '../provider/data_provider_widget.dart';

class SelectorItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final bool selected;

  const SelectorItem({
    required this.onClick,
    required this.title,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedBack(
        onClick: onClick,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                selected ? Icons.check_box : Icons.check_box_outline_blank,
                color: selected ? ThemeColors.primary : Colors.black,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
