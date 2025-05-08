import 'package:flutter/material.dart';

/// A custom border side utility class for consistent border styling throughout the app.
///
/// Extends [BorderSide] to provide predefined named constructors
/// for commonly used border configurations.
final class LuciBorderSide extends BorderSide {
  /// A standard outlined border side with 2px width and black color.
  const LuciBorderSide.outlinedBorderSide() : super(width: 2, color: Colors.black);

  /// A thin border side with 1px width and grey color.
  const LuciBorderSide.thinGrey() : super(width: 1, color: Colors.grey);

  /// A dashed border placeholder (requires a custom painter to render dashed lines).
  const LuciBorderSide.dashed() : super(width: 1.5, color: Colors.black54);
}
