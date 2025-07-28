import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({super.key, required this.icon, this.backgroundColor = const Color(0xFFfcf4e4), this.iconColor = const Color(0xFF756d54),  this.size =45});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2), // Make it circular
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size * 0.5, // Icon size is half of the container size
      ),
    );
  }
}
