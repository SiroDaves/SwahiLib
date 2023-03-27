import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import 'base_styled_button.dart';

class PrimaryBtn extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final bool bigMode;
  final Border border;
  final Color bgColor;
  final Color hoverColor;
  final Color downColor;

  const PrimaryBtn({
    Key? key,
    this.child,
    this.onPressed,
    this.bigMode = false,
    this.border = const Border(),
    this.bgColor = ThemeColors.white,
    this.hoverColor = ThemeColors.grey,
    this.downColor = ThemeColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStyledBtn(
      minWidth: bigMode ? 160 : 78,
      minHeight: bigMode ? 60 : 42,
      contentPadding: EdgeInsets.all(bigMode ? Insets.l : Insets.m),
      border: border,
      bgColor: bgColor,
      hoverColor: hoverColor,
      downColor: downColor,
      borderRadius: bigMode ? Corners.s8 : Corners.s5,
      onPressed: onPressed,
      child: child,
    );
  }
}

class PrimaryTextBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool bigMode;
  final Border border;
  final Color bgColor;
  final Color foreColor;
  final Color hoverColor;
  final Color downColor;

  const PrimaryTextBtn(
    this.label, {
    Key? key,
    this.onPressed,
    this.bigMode = false,
    this.border = const Border(),
    this.bgColor = ThemeColors.white,
    this.foreColor = ThemeColors.black,
    this.hoverColor = ThemeColors.grey,
    this.downColor = ThemeColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle = (bigMode ? TextStyles.Callout : TextStyles.Footnote)
        .bold
        .size(24)
        .textColor(foreColor);
    return Container(
      margin: const EdgeInsets.all(10),
      child: PrimaryBtn(
        bigMode: bigMode,
        onPressed: onPressed,
        border: border,
        bgColor: bgColor,
        hoverColor: hoverColor,
        downColor: downColor,
        child: Text(label, style: txtStyle),
      ),
    );
  }
}

class PrimaryIconTextBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool bigMode;
  final Color bgColor;
  final Color foreColor;
  final Color hoverColor;
  final Color downColor;
  final EdgeInsetsGeometry cPadding;

  const PrimaryIconTextBtn(
    this.icon,
    this.label, {
    Key? key,
    this.onPressed,
    this.bigMode = false,
    this.bgColor = ThemeColors.white,
    this.foreColor = ThemeColors.black,
    this.hoverColor = ThemeColors.primaryDark,
    this.downColor = ThemeColors.primaryDark,
    this.cPadding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle = (bigMode ? TextStyles.Callout : TextStyles.Footnote)
        .bold
        .size(20)
        .textColor(foreColor);
    return Container(
      margin: cPadding,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: PrimaryBtn(
        bigMode: bigMode,
        onPressed: onPressed,
        bgColor: bgColor,
        hoverColor: hoverColor,
        downColor: downColor,
        child: Row(
          children: <Widget>[
            Icon(icon),
            const SizedBox(width: 5),
            Text(label, style: txtStyle),
          ],
        ),
      ),
    );
  }
}

class AdminSummary extends StatelessWidget {
  final IconData icon;
  final int data;
  final String label;
  final VoidCallback? onPressed;
  final bool bigMode;
  final Color bgColor;
  final Color foreColor;
  final Color hoverColor;
  final Color downColor;
  final EdgeInsetsGeometry cPadding;

  const AdminSummary(
    this.icon,
    this.data,
    this.label, {
    Key? key,
    this.onPressed,
    this.bigMode = false,
    this.bgColor = ThemeColors.white,
    this.foreColor = ThemeColors.black,
    this.hoverColor = ThemeColors.primary,
    this.downColor = ThemeColors.primary,
    this.cPadding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle = (bigMode ? TextStyles.Callout : TextStyles.Footnote)
        .bold
        .size(20)
        .textColor(foreColor);
    return Container(
      margin: cPadding,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: PrimaryBtn(
        bigMode: bigMode,
        onPressed: onPressed,
        bgColor: bgColor,
        hoverColor: hoverColor,
        downColor: downColor,
        child: [
          Row(
            children: <Widget>[
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label, style: txtStyle),
                    const SizedBox(width: 5),
                    Text(
                      data.toString(),
                      style: const TextStyle(
                        fontSize: 45,
                        color: ThemeColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ).expanded(),
              Icon(icon, size: 100),
            ],
          ).expanded(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'See more',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward),
            ],
          )
        ].toColumn(),
      ),
    );
  }
}
