import 'package:flutter/material.dart';
import 'package:lucielle/utils/decoration/padding/padding.dart';

/// A custom elevated button widget providing consistent design across the app.
///
/// [LuciElevatedButton] allows customization of padding, shape, border radius,
/// background color, and supports both text-only and icon buttons.
/// 
/// Example usage:
/// ```dart
/// LuciElevatedButton(
///   onPressed: () {},
///   child: Text("Submit"),
/// )
/// ```
///
/// With icon:
/// ```dart
/// LuciElevatedButton.icon(
///   onPressed: () {},
///   icon: Icon(Icons.add),
///   child: Text("Add"),
/// )
/// ```
@immutable
final class LuciElevatedButton extends StatelessWidget {
  /// Creates a regular elevated button.
  const LuciElevatedButton({
    super.key,
    required this.onPressed,
    this.style,
    this.shape,
    this.padding = const LuciPadding.buttonLow(),
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor,
  })  : isIcon = false,
        icon = null;

  /// Creates an elevated button with an icon and a label.
  const LuciElevatedButton.icon({
    super.key,
    required this.child,
    required this.onPressed,
    this.style,
    this.padding = const LuciPadding.buttonMedium(),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.backgroundColor,
    this.shape,
    required this.icon,
  }) : isIcon = true;

  /// The callback triggered when the button is pressed.
  final void Function() onPressed;

  /// Optional custom button style.
  final ButtonStyle? style;

  /// Optional shape for the button (e.g. [RoundedRectangleBorder]).
  final OutlinedBorder? shape;

  /// The main content of the button (typically a [Text] widget).
  final Widget child;

  /// The border radius of the button shape.
  final BorderRadiusGeometry borderRadius;

  /// Optional background color of the button.
  final Color? backgroundColor;

  /// Whether the button includes an icon.
  final bool isIcon;

  /// The icon to show when [isIcon] is true.
  final Icon? icon;

  /// The internal padding of the button. Defaults to [LuciPadding.buttonLow].
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ??
        ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? Colors.white,
          shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
        );

    return isIcon
        ? ElevatedButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon!,
            style: effectiveStyle,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: effectiveStyle,
            child: child,
          );
  }
}
