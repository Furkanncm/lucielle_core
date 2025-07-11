import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucielle/utils/constants/string_constants.dart';
import 'package:lucielle/utils/decoration/textfield_decoration/phone_number_formatter.dart';
import 'package:lucielle/utils/decoration/textfield_decoration/textfield_decoration.dart';
import 'package:lucielle/utils/validator/validator.dart';

class LuciPhoneTextFormField extends StatelessWidget {
  const LuciPhoneTextFormField({
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
    this.enabled,
    this.focusNode,
    this.fillColor,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Called when the text is changed.
  final void Function(String)? onChanged;

  /// Aligns the text within the field.
  final TextAlign? textAlign;

  /// Controls whether validation occurs automatically or manually.
  final AutovalidateMode? autovalidateMode;

  /// Called when editing is complete (e.g., on "done").
  final void Function()? onEditingComplete;

  /// Called when the user submits the field.
  final void Function(String)? onFieldSubmitted;

  /// The action button to display on the keyboard.
  final TextInputAction? textInputAction;

  /// A widget to display before the input (e.g., an icon).
  final Widget? prefixIcon;

  /// Placeholder text shown inside the field when it's empty.
  final String? hintText;

  /// The label displayed above the input.
  final String? labelText;

  /// The maximum number of lines the field can have.
  final int? maxLength;

  /// A widget to display after the input (e.g., visibility toggle).
  final Widget? suffixIcon;

  /// Whether the text field is enabled or disabled.
  final bool? enabled;

  /// An optional focus node to control the field's focus state.
  final FocusNode? focusNode;

  /// The background color of the text field.
  /// Defaults to [Colors.white] if not provided.
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: Validators.phoneNumberValidator,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.left,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      keyboardType: TextInputType.phone,
      decoration: TextfieldDecoration.phone(
        prefixIcon ?? Icon(Icons.phone_in_talk_outlined),
        hintText,
        labelText ?? StringConstants.phone.value,
        suffixIcon,
      ).copyWith(filled: true, fillColor: fillColor ?? Colors.white),
      enabled: enabled,
      focusNode: focusNode,
      maxLines: maxLength ?? 1,
      inputFormatters: [PhoneNumberFormatter(), LengthLimitingTextInputFormatter(14)],
    );
  }
}
