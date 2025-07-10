import 'package:flutter/material.dart';

/// A custom [InputDecoration] class that provides standardized
/// text field styles for email and password fields.
class TextfieldDecoration extends InputDecoration {
  /// Creates an [InputDecoration] specifically designed for email input fields.
  ///
  /// Takes a [prefixIcon], [hintText], [labelText], and an optional [suffixIcon].
  ///
  /// Applies a consistent border radius on both left and right sides.
  TextfieldDecoration.email(this.prefixIcon, this.hintText, this.labelText, this.suffixIcon)
    : super(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(8),
            left: Radius.circular(8),
          ),
        ),
      );

  /// Creates an [InputDecoration] specifically designed for password input fields.
  ///
  /// Similar to [TextfieldDecoration.email], but semantically distinct.
  /// Takes a [prefixIcon], [hintText], [labelText], and a [suffixIcon]
  /// which is typically used for toggling password visibility.
  ///
  /// Applies a consistent border radius on both left and right sides.
  TextfieldDecoration.password(this.prefixIcon, this.hintText, this.labelText, this.suffixIcon)
    : super(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(8),
            left: Radius.circular(8),
          ),
        ),
      );

  TextfieldDecoration.phone(this.prefixIcon, this.hintText, this.labelText, this.suffixIcon)
    : super(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(8),
            left: Radius.circular(8),
          ),
        ),
      );

  /// The icon displayed before the editable part of the text field.
  final Widget? prefixIcon;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that describes the input field, typically used as a label.
  final String? labelText;

  /// An optional icon displayed after the editable part of the text field.
  final Widget? suffixIcon;
}
