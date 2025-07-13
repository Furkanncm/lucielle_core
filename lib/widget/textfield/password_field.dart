import 'package:flutter/material.dart';
import 'package:lucielle/utils/constants/string_constants.dart';
import 'package:lucielle/utils/decoration/textfield_decoration/textfield_decoration.dart';
import 'package:lucielle/utils/validator/validator.dart';

/// A customizable password [TextFormField] widget with built-in validation and visibility toggle.
///
/// This widget is designed for password input and provides built-in support for:
/// - Toggle visibility (show/hide password)
/// - Password validation using [Validators.passwordValidator]
/// - Custom prefix/suffix icons and text decorations
///
/// Example usage:
/// ```dart
/// LuciPasswordTextFormField(
///   controller: passwordController,
///   minSize: 8,
///   isRequiredAtLeast1Uppercase: true,
///   isRequiredAtLeast1Lowercase: true,
/// )
/// ```
class LuciPasswordTextFormField extends StatefulWidget {
  const LuciPasswordTextFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.textAlign,
    this.autovalidateMode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.suffixIcon,
    this.reverseSuffix,
    this.enabled,
    this.focusNode,
    this.minSize = 6,
    this.isRequiredAtLeast1Lowercase = true,
    this.isRequiredAtLeast1Uppercase = true,
    this.fillColor,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Called when the text is changed.
  final void Function(String)? onChanged;

  /// Aligns the text within the field.
  final TextAlign? textAlign;

  /// Controls validation behavior.
  final AutovalidateMode? autovalidateMode;

  /// Called when editing is complete.
  final void Function()? onEditingComplete;

  /// Called when the user submits the field.
  final void Function(String)? onFieldSubmitted;

  /// Specifies the action button on the keyboard.
  final TextInputAction? textInputAction;

  /// A custom widget displayed at the start of the field (e.g., icon).
  final Widget? prefixIcon;

  /// Placeholder text shown when the field is empty.
  final String? hintText;

  /// Label text shown above the field.
  final String? labelText;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// Icon to use when password is hidden (default: [Icons.visibility_outlined]).
  final IconData? suffixIcon;

  /// Icon to use when password is visible (default: [Icons.visibility_off_outlined]).
  final IconData? reverseSuffix;

  /// Whether the field is enabled for input.
  final bool? enabled;

  /// Controls the focus of this widget.
  final FocusNode? focusNode;

  /// Minimum required password length. Default is 6.
  final int minSize;

  /// Whether at least one lowercase character is required.
  final bool isRequiredAtLeast1Lowercase;

  /// Whether at least one uppercase character is required.
  final bool isRequiredAtLeast1Uppercase;

  /// The background color of the text field.
  /// Defaults to [Colors.white] if not provided.
  final Color? fillColor;
  @override
  State<LuciPasswordTextFormField> createState() => _LuciPasswordTextFormFieldState();
}

class _LuciPasswordTextFormFieldState extends State<LuciPasswordTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator:
          (value) => Validators.passwordValidator(
            value,
            minSize: widget.minSize,
            isRequiredAtLeast1Lowercase: widget.isRequiredAtLeast1Lowercase,
            isRequiredAtLeast1Uppercase: widget.isRequiredAtLeast1Uppercase,
          ),
      onChanged: widget.onChanged,
      textAlign: widget.textAlign ?? TextAlign.left,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onEditingComplete: widget.onEditingComplete,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: TextfieldDecoration.password(
        widget.prefixIcon ?? Icon(Icons.lock_open_outlined),
        widget.hintText,
        widget.labelText ?? StringConstants.password.value,
        IconButton(
          onPressed: () => setState(() => obscureText = !obscureText),
          icon: Icon(
            obscureText 
                ? (widget.suffixIcon ?? Icons.visibility_off_outlined)
                : (widget.reverseSuffix ?? Icons.visibility_outlined),
          ),
        ),
      ).copyWith(
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
      ),
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
    );
  }
}
