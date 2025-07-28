import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate responsive font size (base size scaled by screen width)
    final responsiveSize = size * (screenWidth / 375); // 375 is a reference width (e.g., iPhone 6/7/8)

    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: responsiveSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}