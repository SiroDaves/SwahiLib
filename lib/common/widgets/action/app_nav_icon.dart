import 'package:flutter/material.dart';

class AppNavIcon extends StatelessWidget {
  const AppNavIcon(
    this.icon, {
    super.key,
    this.color,
    this.height,
    this.width,
  });
  final IconData icon;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color);
  }
}
