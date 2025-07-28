import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size; // Base size, will be scaled
  double height;
  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12, // Base font size
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    // Scale factor: Adjusts size based on screen width (e.g., 360 is a reference width)
    final scaleFactor = screenWidth / 360;
    // Responsive font size
    final responsiveSize = size * scaleFactor;

    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: responsiveSize, // Use responsive size
        height: height,
      ),
    );
  }
}