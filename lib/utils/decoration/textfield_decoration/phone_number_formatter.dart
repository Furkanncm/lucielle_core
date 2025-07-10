import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    String newText = '';
    for (int i = 0; i < digits.length; i++) {
      if (i == 0) newText += '(';
      if (i == 3) newText += ') ';
      if (i == 6) newText += ' ';
      newText += digits[i];
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
