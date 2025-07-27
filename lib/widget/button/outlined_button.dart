import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../lucielle.dart';

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
    required this.icon,
    this.padding,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderColor = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderSide,
    this.backgroundColor,
    super.key,
  }) : isIcon = true,
       assert(icon != null);

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

  /// Optional custom border side. If null, [borderColor] is used.
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
      side: borderSide ?? BorderSide(color: borderColor),
      backgroundColor: backgroundColor,
      padding: padding ?? LuciPadding.symetric(),
      minimumSize: Size(minSize, minSize),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
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
