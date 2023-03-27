import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

enum IndicatorSide { start, end }

/// A vertical tab widget for flutter
class Presentable extends StatefulWidget {
  final Key? key;
  final int? index;
  final double? tabsWidth;
  final double? indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab>? tabs;
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

  const Presentable(
      {this.key,
      required this.index,
      required this.tabs,
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
      this.tabTextStyle = const TextStyle(color: Colors.black38),
      this.changePageCurve = Curves.easeInOut,
      this.changePageDuration = const Duration(milliseconds: 300),
      this.tabsShadowColor = Colors.black54,
      this.tabsElevation = 2.0,
      this.onSelect,
      this.backgroundColor})
      : assert(
            tabs != null && contents != null && tabs.length == contents.length),
        super(key: key);

  @override
  PresentableState createState() => PresentableState();
}

class PresentableState extends State<Presentable>
    with TickerProviderStateMixin {
  int? selectedIndex;
  bool? changePageByTapView;

  AnimationController? animationController;
  Animation<double?>? animation;
  Animation<RelativeRect?>? rectAnimation;

  PageController? pageController = PageController();

  List<AnimationController?>? animationControllers = [];

  ScrollPhysics? pageScrollPhysics = const AlwaysScrollableScrollPhysics();
  double targetOpacity = 1;

  @override
  void didUpdateWidget(Presentable oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => targetOpacity = 0);
    Future.delayed(1.milliseconds, () => setState(() => targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    selectedIndex = widget.index;
    for (int? i = 0; i! < widget.tabs!.length; i++) {
      animationControllers!.add(AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ));
    }
    selectTab(widget.index!);

    if (widget.disabledChangePageFromContentView == true) {
      pageScrollPhysics = const NeverScrollableScrollPhysics();
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController!.jumpToPage(widget.index!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var contentContainer = Expanded(
      child: PageView.builder(
        scrollDirection: widget.contentScrollAxis!,
        physics: pageScrollPhysics,
        onPageChanged: (index) {
          if (changePageByTapView == false || changePageByTapView == null) {
            selectTab(index);
          }
          if (selectedIndex == index) {
            changePageByTapView = null;
          }
          setState(() {});
        },
        controller: pageController,

        // the number of pages
        itemCount: widget.contents!.length,

        // building pages
        itemBuilder: (BuildContext? context, int? index) {
          return widget.contents![index!];
        },
      ),
    );
    var indicatorContainer = SizedBox(
      height: widget.tabsWidth,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tabs!.length,
        itemBuilder: (context, index) {
          Tab? tab = widget.tabs![index];

          Alignment? alignment = Alignment.centerLeft;
          if (widget.direction == TextDirection.rtl) {
            alignment = Alignment.centerRight;
          }

          Widget? child;
          if (tab.child != null) {
            child = tab.child;
          } else {
            child = Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  (tab.icon != null)
                      ? Row(
                          children: <Widget>[
                            tab.icon!,
                            const SizedBox(width: 5)
                          ],
                        )
                      : Container(),
                  (tab.text != null)
                      ? SizedBox(
                          width: widget.tabsWidth,
                          child: Text(
                            tab.text!,
                            softWrap: true,
                            style: selectedIndex == index
                                ? widget.selectedTabTextStyle
                                : widget.tabTextStyle,
                          ))
                      : Container(),
                ],
              ),
            );
          }

          var itemBGColor = widget.tabBackgroundColor;
          if (selectedIndex == index) {
            itemBGColor = widget.selectedTabBackgroundColor;
          }

          double? left, right;
          if (widget.direction == TextDirection.rtl) {
            left = (widget.indicatorSide == IndicatorSide.end) ? 0 : null;
            right = (widget.indicatorSide == IndicatorSide.start) ? 0 : null;
          } else {
            left = (widget.indicatorSide == IndicatorSide.start) ? 0 : null;
            right = (widget.indicatorSide == IndicatorSide.end) ? 0 : null;
          }

          return Stack(
            children: <Widget>[
              Positioned(
                top: 2,
                bottom: 2,
                width: widget.indicatorWidth,
                left: left,
                right: right,
                child: ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationControllers![index]!,
                      curve: Curves.elasticOut,
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ThemeColors.accent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changePageByTapView = true;
                  setState(() {
                    selectTab(index);
                  });

                  pageController!.animateToPage(index,
                      duration: widget.changePageDuration!,
                      curve: widget.changePageCurve!);
                },
                child: Container(
                  width: widget.indicatorWidth,
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: itemBGColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  alignment: alignment,
                  padding: const EdgeInsets.all(5),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
    return Directionality(
      textDirection: widget.direction!,
      child: Column(
        children: <Widget>[
          contentContainer,
          indicatorContainer,
        ],
      ),
    );
  }

  void selectTab(int index) {
    selectedIndex = index;
    for (final AnimationController? animationController
        in animationControllers!) {
      animationController!.reset();
    }
    animationControllers![index]!.forward();

    if (widget.onSelect != null) {
      widget.onSelect!(selectedIndex);
    }
  }
}
