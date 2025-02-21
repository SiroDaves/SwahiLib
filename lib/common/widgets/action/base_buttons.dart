import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../core/theme/theme_styles.dart';

class AppButton extends StatefulWidget {
  final String label;
  final Widget prefix;
  final Widget suffix;
  final bool bigMode;
  final bool showIcon;
  final bool showShadow;
  final Border border;
  final bool centered;
  final bool alignHorizontally;
  final double? width;
  final double? height;
  final Color bgColor;
  final Color borderColor;
  final Color foreColor;
  final Color hoverColor;
  final Color downColor;
  final double? fontSize;
  final ShapeBorder? shape;
  final Color outlineColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const AppButton({
    super.key,
    this.label = '',
    this.prefix = const SizedBox(),
    this.suffix = const SizedBox(),
    this.border = const Border(),
    this.width,
    this.height,
    this.onPressed,
    this.bigMode = false,
    this.showIcon = false,
    this.showShadow = false,
    this.centered = true,
    this.alignHorizontally = false,
    this.fontSize = FontSizes.s18,
    this.bgColor = ThemeColors.primary,
    this.borderColor = Colors.white,
    this.foreColor = Colors.black,
    this.hoverColor = ThemeColors.primaryDark,
    this.downColor = ThemeColors.primary,
    this.margin = const EdgeInsets.symmetric(
      horizontal: Sizes.sm,
      vertical: Sizes.xs,
    ),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.m,
      vertical: Sizes.m / 2,
    ),
    this.shape,
    this.outlineColor = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(Sizes.sm)),
  });

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  late FocusNode focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode(debugLabel: "", canRequestFocus: true);
    focusNode.addListener(() {
      if (focusNode.hasFocus != isFocused) {
        setState(() => isFocused = focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle = TextStyle(
      color: widget.foreColor,
      fontSize: widget.fontSize,
      fontWeight: FontWeight.bold,
    );

    var withIcon = widget.alignHorizontally
        ? Row(
            mainAxisAlignment: widget.centered
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: widget.centered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              widget.prefix,
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: txtStyle,
                textAlign: TextAlign.center,
              ),
              widget.centered ? const SizedBox() : const Spacer(),
              widget.suffix,
            ],
          )
        : Column(
            mainAxisAlignment: widget.centered
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: widget.centered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              widget.prefix,
              const SizedBox(width: 5),
              Text(widget.label, style: txtStyle, textAlign: TextAlign.center),
              widget.suffix,
            ],
          );

    var childWidget = widget.showIcon
        ? withIcon
        : Text(widget.label, style: txtStyle, textAlign: TextAlign.center);

    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: widget.border,
        borderRadius: widget.borderRadius,
      ),
      foregroundDecoration: isFocused
          ? ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1.8,
                  color: ThemeColors.accent,
                ),
                borderRadius: widget.borderRadius,
              ),
            )
          : null,
      child: RawMaterialButton(
        focusNode: focusNode,
        textStyle: TextStyle(
          color: widget.foreColor,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.bold,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        splashColor: Colors.transparent,
        mouseCursor: SystemMouseCursors.click,
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        fillColor: Colors.transparent,
        hoverColor: widget.hoverColor,
        highlightColor: widget.downColor,
        focusColor: Colors.grey.withOpacity(0.35),
        constraints: BoxConstraints(
          minHeight: widget.bigMode ? 60 : 42,
          minWidth: widget.bigMode ? 160 : 78,
        ),
        onPressed: widget.onPressed,
        shape: widget.shape ??
            RoundedRectangleBorder(
                side: BorderSide(color: widget.outlineColor, width: 1.5),
                borderRadius: widget.borderRadius),
        child: Opacity(
          opacity: widget.onPressed != null ? 1 : 0.7,
          child: Padding(
            padding: widget.padding,
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
