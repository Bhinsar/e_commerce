import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  // Reference dimensions (e.g., based on iPhone 12 Pro: 844x390)
  static const double _referenceHeight = 844.0;
  static const double _referenceWidth = 390.0;

  // Get screen dimensions dynamically using MediaQuery
  static double get screenHeight => MediaQuery.sizeOf(Get.context!).height;
  static double get screenWidth => MediaQuery.sizeOf(Get.context!).width;

  // Scale factor for responsiveness
  static double get heightScaleFactor => screenHeight / _referenceHeight;
  static double get widthScaleFactor => screenWidth / _referenceWidth;

  // Responsive page view dimensions
  static double get pageView => screenHeight / 2.64 * heightScaleFactor;
  static double get pageViewContainer => screenHeight / 4.25 * heightScaleFactor;
  static double get pageViewTextContainer => screenHeight / 6.03 * heightScaleFactor;

  // Responsive height dimensions
  static double get height10 => screenHeight / 84.4 * heightScaleFactor;
  static double get height15 => screenHeight / 56.27 * heightScaleFactor;
  static double get height20 => screenHeight / 42.2 * heightScaleFactor;
  static double get height30 => screenHeight / 28.13 * heightScaleFactor;
  static double get height45 => screenHeight / 19.56 * heightScaleFactor;

  // Responsive width dimensions
  static double get width10 => screenWidth / 84.4 * widthScaleFactor;
  static double get width15 => screenWidth / 56.27 * widthScaleFactor;
  static double get width20 => screenWidth / 42.2 * widthScaleFactor;
  static double get width30 => screenWidth / 28.13 * widthScaleFactor;
  static double get width45 => screenWidth / 19.56 * widthScaleFactor;

  // Utility to get scaled dimension for any custom value
  static double scaleHeight(double height) => height * heightScaleFactor;
  static double scaleWidth(double width) => width * widthScaleFactor;

  // Check if device is in landscape mode
  static bool get isLandscape => screenWidth > screenHeight;
}