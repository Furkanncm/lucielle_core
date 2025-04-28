import 'package:flutter/material.dart';

/// An extension on [BuildContext] that provides easy access to various properties
/// of the device's screen and system using [MediaQuery].
/// This includes screen size, orientation, keyboard visibility, device type, 
/// safe area insets, and more.
extension MediaQueryExtensions on BuildContext {
  
  /// Provides access to the [MediaQueryData] for the current context.
  /// Allows access to various media-related properties such as screen size, 
  /// orientation, and device pixel ratio.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the screen size (width and height) of the device as a [Size] object.
  Size get screenSizes => mediaQuery.size;

  /// Returns the height of the screen.
  double get height => screenSizes.height;

  /// Returns the width of the screen.
  double get width => screenSizes.width;

  /// Returns `true` if the keyboard is open, based on the view insets.
  /// The keyboard is considered open if the bottom view inset is greater than 0.
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;

  /// Returns `true` if the device is in portrait orientation (vertical).
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns `true` if the device is in landscape orientation (horizontal).
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Returns the device's pixel ratio, which scales logical pixels to physical pixels.
  /// Used for higher resolution screens.
  double get pixelRatio => mediaQuery.devicePixelRatio;

  /// Returns the insets for the safe area, such as the top notch or bottom bar.
  /// This helps in handling devices with special display areas (e.g., notches or gesture bars).
  EdgeInsets get safeAreaInsets => mediaQuery.padding;

  /// Returns `true` if the device is in dual-screen or landscape mode,
  /// where the width is greater than the height.
  bool get isDualScreen => width > height;

  /// Returns `true` if the device is a tablet.
  /// This is determined based on the shortest side of the screen being greater than 600 pixels.
  bool get isTablet => screenSizes.shortestSide > 600;

  /// Returns `true` if the device is a phone.
  /// This is determined based on the shortest side of the screen being less than or equal to 600 pixels.
  bool get isPhone => screenSizes.shortestSide <= 600;

  /// Returns the view insets, such as the space taken up by the keyboard.
  /// This is useful to determine how much space is available for the UI.
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
}
