import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucielle/utils/decoration/border/border_side.dart';
import 'package:lucielle/utils/decoration/padding/padding.dart';

/// A custom outlined button widget that provides consistent styling across the app.
///
/// The [LuciOutlinedButton] supports both regular and icon-based outlined buttons,
/// with flexible configuration options such as border color, padding,
/// minimum size, border radius, and optional background color.
///
/// Example usage:
/// ```dart
/// LuciOutlinedButton(
///   onPressed: () {},
///   child: Text('Submit'),
/// )
/// ```
///
/// Or with an icon:
/// ```dart
/// LuciOutlinedButton.icon(
///   onPressed: () {},
///   icon: Icon(Icons.add),
///   child: Text('Add'),
/// )
/// ``
@immutable
final class LuciOutlinedButton extends StatelessWidget {
  /// Creates a custom outlined button with only a child widget.
  const LuciOutlinedButton({
    required this.child,
    required this.onPressed,
    this.padding,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderColor = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderSide,
    this.backgroundColor,
    super.key,
  }) : isIcon = false,
       icon = null;

  /// Creates a custom outlined button with an icon and a label.
  const LuciOutlinedButton.icon({
    required this.child,
    required this.onPressed,
    this.padding,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderColor = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderSide,
    this.backgroundColor,
    this.icon,
    super.key,
  }) : isIcon = true;

  /// The child widget (usually a [Text]) inside the button.
  final Widget child;

  /// The callback when the button is pressed.
  final void Function()? onPressed;

  /// Custom padding inside the button. Defaults to [LuciPadding.symetric].
  final EdgeInsetsGeometry? padding;

  /// The minimum width and height of the button. Defaults to [kMinInteractiveDimensionCupertino].
  final double minSize;

  /// The color of the button border. Ignored if [borderSide] is provided.
  final Color borderColor;

  /// The border radius of the button.
  final BorderRadius borderRadius;

  /// Optional custom border side. If null, [LuciBorderSide.outlinedBorderSide] is used.
  final BorderSide? borderSide;

  /// Optional background color of the button.
  final Color? backgroundColor;

  /// Whether this button includes an icon.
  final bool isIcon;

  /// The icon widget if [isIcon] is true.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final outlinedButtonStyle = OutlinedButton.styleFrom(
      side: BorderSide(color: borderColor),
      backgroundColor: backgroundColor,
      padding: padding ?? LuciPadding.symetric(),
      minimumSize: Size(minSize, minSize),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: borderSide ?? LuciBorderSide.outlinedBorderSide(),
      ),
    );

    return isIcon
        ? OutlinedButton.icon(
          onPressed: onPressed,
          label: child,
          icon: icon!,
          style: outlinedButtonStyle,
        )
        : OutlinedButton(onPressed: onPressed, style: outlinedButtonStyle, child: child);
  }
}
