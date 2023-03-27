import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';

enum IndicatorSide { start, end }

/// A vertical tab widget for flutter
class Projectable extends StatefulWidget {
  final Key? key;
  final int? index;
  final double? tabsWidth;
  final double? indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<String>? infos;
  final List<Widget>? contents;
  final TextDirection? direction;
  final Color? indicatorColor;
  final bool? disabledChangePageFromContentView;
  final Axis? contentScrollAxis;
  final Color? selectedTabBackgroundColor;
  final Color? tabBackgroundColor;
  final TextStyle? selectedTabTextStyle;
  final TextStyle? tabTextStyle;
  final Duration? changePageDuration;
  final Curve? changePageCurve;
  final Color? tabsShadowColor;
  final double? tabsElevation;
  final Function(int? tabIndex)? onSelect;
  final Color? backgroundColor;

  const Projectable(
      {this.key,
      required this.index,
      required this.infos,
      required this.contents,
      this.tabsWidth = 200,
      this.indicatorWidth = 3,
      this.indicatorSide,
      this.direction = TextDirection.ltr,
      this.indicatorColor = Colors.green,
      this.disabledChangePageFromContentView = false,
      this.contentScrollAxis = Axis.horizontal,
      this.selectedTabBackgroundColor = const Color(0x1100ff00),
      this.tabBackgroundColor = const Color(0xfff8f8f8),
      this.selectedTabTextStyle = const TextStyle(color: Colors.black),
      this.tabTextStyle = const TextStyle(color: Colors.black),
      this.changePageCurve = Curves.easeInOut,
      this.changePageDuration = const Duration(milliseconds: 300),
      this.tabsShadowColor = Colors.black54,
      this.tabsElevation = 2.0,
      this.onSelect,
      this.backgroundColor})
      : assert(infos != null &&
            contents != null &&
            infos.length == contents.length),
        super(key: key);

  @override
  ProjectableState createState() => ProjectableState();
}

class ProjectableState extends State<Projectable>
    with TickerProviderStateMixin {
  double targetOpacity = 1;
  List<AnimationController?>? animationControllers = [];

  @override
  void didUpdateWidget(Projectable oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => targetOpacity = 0);
    Future.delayed(1.milliseconds, () => setState(() => targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var indicatorContainer = SizedBox(
      height: widget.tabsWidth,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.infos!.length,
        itemBuilder: (context, index) {
          bool isSelected = index == widget.index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: RawMaterialButton(
              fillColor: isSelected ? ThemeColors.primary : Colors.white,
              highlightColor: Colors.white.withOpacity(.1),
              focusElevation: 0,
              hoverColor: ThemeColors.lightGrey,
              hoverElevation: 1,
              highlightElevation: 0,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              onPressed: () => setState(() {
                
              }),
              child: Text(
                widget.infos![index],
                style: TextStyles.Btn.bold
                    .size(30)
                    .textColor(isSelected ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
    return Column(
      children: <Widget>[
        Expanded(
          child: IndexedStack(
            index: widget.index,
            children: widget.contents!,
          ),
        ),
        indicatorContainer,
        const SizedBox(height: 20),
      ],
    );
  }
}
