import 'package:flutter/material.dart';
import 'package:lucielle/widget/widget.dart';

/// `NaText` is a custom `StatelessWidget` that simplifies the usage of
/// predefined text styles based on font sizes, mimicking Flutter's
/// typography variants (like displayLarge, titleMedium, etc).
///
/// It provides a consistent and centralized way to style text throughout
/// the app with named constructors for different text categories.
///
/// If the `data` is null or empty, `EmptyBox()` is returned instead of a `Text` widget.
@immutable
final class LuciText extends StatelessWidget {
  /// `displayLarge` corresponds to a very large text style, typically used for
  /// large headings or splash screens. Default font size is `64`.
  LuciText.displayLarge(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 64, fontWeight: fontWeight, color: textColor);

  /// `displayMedium` has a default font size of `52`.
  LuciText.displayMedium(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 52, fontWeight: fontWeight, color: textColor);

  /// `displaySmall` has a default font size of `44`.
  LuciText.displaySmall(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 44, fontWeight: fontWeight, color: textColor);

  /// `headlineLarge` has a default font size of `40`.
  LuciText.headlineLarge(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 40, fontWeight: fontWeight, color: textColor);

  /// `headlineMedium` has a default font size of `36`.
  LuciText.headlineMedium(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 36, fontWeight: fontWeight, color: textColor);

  /// `headlineSmall` has a default font size of `32`.
  LuciText.headlineSmall(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 32, fontWeight: fontWeight, color: textColor);

  /// `titleLarge` has a default font size of `28`.
  LuciText.titleLarge(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 28, fontWeight: fontWeight, color: textColor);

  /// `titleMedium` has a default font size of `26`.
  LuciText.titleMedium(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 26, fontWeight: fontWeight, color: textColor);

  /// `titleSmall` has a default font size of `24`.
  LuciText.titleSmall(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 24, fontWeight: fontWeight, color: textColor);

  /// `labelLarge` has a default font size of `22`.
  LuciText.labelLarge(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 22, fontWeight: fontWeight, color: textColor);

  /// `labelMedium` has a default font size of `20`.
  LuciText.labelMedium(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 20, fontWeight: fontWeight, color: textColor);

  /// `labelSmall` has a default font size of `18`.
  LuciText.labelSmall(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 18, fontWeight: fontWeight, color: textColor);

  /// `bodyLarge` has a default font size of `16`.
  LuciText.bodyLarge(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 16, fontWeight: fontWeight, color: textColor);

  /// `bodyMedium` has a default font size of `14`.
  LuciText.bodyMedium(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 14, fontWeight: fontWeight, color: textColor);

  /// `bodySmall` has a default font size of `12`.
  LuciText.bodySmall(
    this.data, {
    super.key,
    this.customTextStyle,
    this.fontWeight,
    this.textColor,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : style = customTextStyle ?? TextStyle(fontSize: 12, fontWeight: fontWeight, color: textColor);

  /// The text content to be displayed.
  final String? data;

  /// The resolved `TextStyle` used internally.
  final TextStyle? style;

  /// Optional custom `TextStyle` to override the default one.
  final TextStyle? customTextStyle;

  /// Optional font weight.
  final FontWeight? fontWeight;

  /// Optional text color.
  final Color? textColor;

  /// Optional strut style.
  final StrutStyle? strutStyle;

  /// Optional text alignment.
  final TextAlign? textAlign;

  /// Optional text direction.
  final TextDirection? textDirection;

  /// Optional locale.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The scaling factor for the text.
  final TextScaler? textScaler;

  /// Maximum number of lines for the text.
  final int? maxLines;

  /// Semantics label for accessibility.
  final String? semanticsLabel;

  /// How the width of the text should be determined.
  final TextWidthBasis? textWidthBasis;

  /// Text height behavior.
  final TextHeightBehavior? textHeightBehavior;

  /// The color of text selection.
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return switch (data) {
      null || '' => emptyBox,
      _ => Text(
        data!,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      ),
    };
  }
}
