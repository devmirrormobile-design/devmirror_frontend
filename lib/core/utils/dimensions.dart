import 'package:flutter/widgets.dart';

/// Centralized dimension utility for perfectly responsive scaling.
/// Based on a standard 390x844 design draft (e.g., iPhone 12/13/14).
class Dimensions {
  static late double screenWidth;
  static late double screenHeight;

  static const double _designWidth = 390.0;
  static const double _designHeight = 844.0;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double w(double width) => (width / _designWidth) * screenWidth;
  static double h(double height) => (height / _designHeight) * screenHeight;
  static double sp(double size) => (size / _designWidth) * screenWidth;

  static double get width => screenWidth;
  static double get height => screenHeight;
}
