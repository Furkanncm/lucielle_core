import 'package:flutter/material.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/decoration/textfield_decoration/textfield_decoration.dart';
import '../../utils/validator/validator.dart';

/// A customizable password [TextFormField] widget with built-in validation and visibility toggle.
///
/// This widget is designed for password input and provides:
/// - Password visibility toggle (show/hide password)
/// - Validation logic via [Validators.passwordValidator] or a custom validator
/// - Optional confirm password comparison
/// - Fully customizable UI (icons, labels, colors, etc.)
///
/// Example usage:
/// ```dart
/// LuciPasswordTextFormField(
///   controller: passwordController,
///   confirmController: confirmPasswordController, // optional
///   minSize: 8,
///   isRequiredAtLeast1Uppercase: true,
///   isRequiredAtLeast1Lowercase: true,
/// )
/// ```
class LuciPasswordTextFormField extends StatefulWidget {
  /// Creates a [LuciPasswordTextFormField].
  LuciPasswordTextFormField({
    super.key,
    this.controller,
    this.confirmController,
    this.validator,
    this.onChanged,
    this.textAlign,
    this.autovalidateMode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.initialValue,
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

  /// Controller for the main password input.
  final TextEditingController? controller;

  /// Optional controller to compare for "confirm password" validation.
  final TextEditingController? confirmController;

  /// Custom validator function. If null, [Validators.passwordValidator] is used.
  final String? Function(String?)? validator;

  /// Called when the text changes.
  final void Function(String)? onChanged;

  /// Aligns text within the field. Default is [TextAlign.left].
  final TextAlign? textAlign;

  /// Auto validation mode for the form field.
  final AutovalidateMode? autovalidateMode;

  /// Called when editing is complete (e.g. focus changes).
  final void Function()? onEditingComplete;

  /// Called when the user submits the field (e.g. presses "done" on keyboard).
  final void Function(String)? onFieldSubmitted;

  /// Sets the keyboard action button (e.g. done, next).
  final TextInputAction? textInputAction;

  /// Optional prefix icon (e.g. lock icon).
  final Widget? prefixIcon;

  /// Hint text shown inside the field when it is empty.
  final String? hintText;

  /// Label shown above the field.
  final String? labelText;

  final String? initialValue;


  /// Maximum number of characters allowed in the field.
  final int? maxLength;

  /// Icon shown when password is hidden (e.g. eye closed).
  final IconData? suffixIcon;

  /// Icon shown when password is visible (e.g. eye open).
  final IconData? reverseSuffix;

  /// Whether the field is enabled. Default is true.
  final bool? enabled;

  /// Focus node to manage focus manually.
  final FocusNode? focusNode;

  /// Minimum required length of the password. Default is 6.
  final int minSize;

  /// Whether the password must contain at least one lowercase letter.
  final bool isRequiredAtLeast1Lowercase;

  /// Whether the password must contain at least one uppercase letter.
  final bool isRequiredAtLeast1Uppercase;

  /// Background color of the field. Default is [Colors.white].
  final Color? fillColor;

  @override
  State<LuciPasswordTextFormField> createState() => _LuciPasswordTextFormFieldState();
}

class _LuciPasswordTextFormFieldState extends State<LuciPasswordTextFormField> {
  /// Tracks whether the password is hidden (obscured).
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) =>
          widget.validator?.call(value) ??
          Validators.passwordValidator(
            value,
            minSize: widget.minSize,
            isRequiredAtLeast1Lowercase: widget.isRequiredAtLeast1Lowercase,
            isRequiredAtLeast1Uppercase: widget.isRequiredAtLeast1Uppercase,
            compareWith: widget.confirmController?.text,
          ),
      onChanged: widget.onChanged,
      textAlign: widget.textAlign ?? TextAlign.left,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      initialValue: widget.initialValue,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      decoration: TextfieldDecoration.password(
        widget.prefixIcon ?? const Icon(Icons.lock_open_outlined),
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
    );
  }
}
