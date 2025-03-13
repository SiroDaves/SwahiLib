import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? borderColor;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.onTap,
    this.buttonColor,
    this.borderRadius,
    this.textColor,
    required this.buttonText,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 10,
              vertical: verticalPadding ?? 10,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize ?? 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
