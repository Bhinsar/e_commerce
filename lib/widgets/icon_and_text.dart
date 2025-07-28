import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate responsive icon size based on screen width
    double iconSize = MediaQuery.of(context).size.width * 0.05; // 5% of screen width
    iconSize = iconSize.clamp(20.0, 30.0); // Ensure size is between 20 and 30

    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(width: Dimensions.width10),
        SmallText(
          text: text,
          size: 12, // Base size, will be scaled
          color: Colors.black54, // Default color for text
        ),
      ],
    );
  }
}