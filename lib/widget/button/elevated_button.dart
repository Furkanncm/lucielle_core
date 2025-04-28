import 'package:flutter/material.dart';

final class LuciElevatedButton extends StatelessWidget {
  const LuciElevatedButton({
    super.key,
    this.onPressed,
    this.style,
    this.shape,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor,
    this.colorScheme,
  }) : isIcon = false,
       icon = null;

  const LuciElevatedButton.icon({
    super.key,
    required this.child,
    required this.onPressed,
    required this.style,
    required this.borderRadius,
    required this.colorScheme,
    required this.backgroundColor,
    required this.shape,
    required this.icon,
  }) : isIcon = true;

  final void Function()? onPressed;
  final ButtonStyle? style;
  final OutlinedBorder? shape;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final Color? backgroundColor;
  final ColorScheme? colorScheme;
  final bool isIcon;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        style ??
        ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colorScheme?.primary ?? Colors.white,
          shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
        );
    return isIcon
        ? ElevatedButton.icon(
          onPressed: onPressed,
          label: child,
          icon: icon,
          style: style ?? effectiveStyle,
        )
        : ElevatedButton(onPressed: onPressed, style: style ?? effectiveStyle, child: child);
  }
}
