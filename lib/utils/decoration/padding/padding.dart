import 'package:flutter/widgets.dart';

/// A custom padding utility class for consistent spacing throughout the app.
///
/// Provides predefined named constructors for common padding configurations.
/// Extends [EdgeInsets] for seamless use in widgets that accept padding.
class LuciPadding extends EdgeInsets {
  /// Low padding for buttons (8 pixels on all sides).
  const LuciPadding.buttonLow() : super.all(8);

  /// Medium padding for buttons (12 pixels on all sides).
  const LuciPadding.buttonMedium() : super.all(12);

  /// High padding for buttons (16 pixels on all sides).
  const LuciPadding.buttonHigh() : super.all(16);

  /// Symmetrical padding with 20px horizontal and 12px vertical.
  const LuciPadding.symetric() : super.symmetric(horizontal: 20, vertical: 12);

  /// Small horizontal padding only.
  const LuciPadding.horizontalSmall() : super.symmetric(horizontal: 8);

  /// Medium horizontal padding only.
  const LuciPadding.horizontalMedium() : super.symmetric(horizontal: 16);

  /// Large horizontal padding only.
  const LuciPadding.horizontalLarge() : super.symmetric(horizontal: 24);

  /// Small vertical padding only.
  const LuciPadding.verticalSmall() : super.symmetric(vertical: 8);

  /// Medium vertical padding only.
  const LuciPadding.verticalMedium() : super.symmetric(vertical: 16);

  /// Large vertical padding only.
  const LuciPadding.verticalLarge() : super.symmetric(vertical: 24);
}
