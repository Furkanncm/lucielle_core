/// Extension for adding utility methods to the `String` type.
extension StringExtension on String {
  /// Adds the [other] string to the current string with a specified separator.
  ///
  /// - [other]: The string to append.
  /// - [separator]: The separator between the two strings. Defaults to a space `' '`.
  ///
  /// Example:
  /// ```dart
  /// "Hello".addWithSeparator("World", ", ");  // Result: "Hello, World"
  /// ```
  String addWithSeparator(String other, [String separator = ' ']) {
    return this + separator + other;
  }

  /// Trims whitespace from both ends of the string and removes all special characters.
  ///
  /// Special characters include anything that is not a letter (a-z, A-Z), number (0-9), or space.
  ///
  /// Example:
  /// ```dart
  /// "  Hello@World!  ".trimAndRemoveSpecialChars;  // Result: "HelloWorld"
  /// ```
  String get trimAndRemoveSpecialChars {
    return trim().replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
  }

  /// Capitalizes the first letter of every word in the string.
  ///
  /// This method splits the string by spaces and capitalizes the first letter of each word.
  ///
  /// Example:
  /// ```dart
  /// "hello world".capitalizeWords;  // Result: "Hello World"
  /// ```
  String get capitalizeWords {
    return split(' ')
        .map((word) {
          return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '';
        })
        .join(' ');
  }

  /// Capitalizes only the first letter of the string.
  ///
  /// If the string is not empty, the first letter is capitalized and the rest remains the same.
  ///
  /// Example:
  /// ```dart
  /// "hello world".capitalizeFirst;  // Result: "Hello world"
  /// ```
  String get capitalizeFirst {
    return isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
  }

  /// Tries to parse the string as an integer.
  ///
  /// Returns `null` if the string cannot be converted to an integer.
  ///
  /// Example:
  /// ```dart
  /// "123".toIntOrNull();  // Result: 123
  /// "abc".toIntOrNull();  // Result: null
  /// ```
  int? toIntOrNull() {
    return int.tryParse(this);
  }

  /// Extracts a substring from [startIndex] to [endIndex].
  ///
  /// If the indices are out of bounds, an empty string is returned.
  ///
  /// Example:
  /// ```dart
  /// "Hello World".substringRange(0, 5);  // Result: "Hello"
  /// ```
  String substringRange(int startIndex, int endIndex) {
    if (startIndex >= 0 && endIndex <= length) {
      return substring(startIndex, endIndex);
    }
    return ''; // Or throw an error
  }

  /// Checks if the string is a valid email.
  ///
  /// Validates the string format based on the common email structure.
  /// Example:
  /// ```dart
  /// "test@example.com".isEmail;  // Result: true
  /// "invalid-email".isEmail;  // Result: false
  /// ```
  bool get isEmail {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(this);
  }

  /// Checks if the string is a valid password.
  ///
  /// The password should contain at least:
  /// - [minSize] characters (default is 6)
  /// - Optionally, at least 1 uppercase letter ([isRequiredAtLeast1Uppercase])
  /// - Optionally, at least 1 lowercase letter ([isRequiredAtLeast1Lowercase])
  /// - At least 1 digit.
  ///
  /// Example:
  /// ```dart
  /// "Password123".isPassword(minSize: 8);  // Result: true
  /// "password".isPassword(minSize: 8);  // Result: false
  /// ```
bool isPassword({
  int minSize = 6,
  bool isRequiredAtLeast1Uppercase = true,
  bool isRequiredAtLeast1Lowercase = true,
}) {
  String pattern = r'^(?=.*\d)'; // At least one digit

  if (isRequiredAtLeast1Uppercase) {
    pattern += r'(?=.*[A-Z])';
  }
  if (isRequiredAtLeast1Lowercase) {
    pattern += r'(?=.*[a-z])';
  }

  pattern += '[A-Za-z\\d]{$minSize,}\$';

  final regex = RegExp(pattern);
  return regex.hasMatch(this);
}
  /// Checks if the string is a valid phone number (basic format check).
  ///
  /// Validates that the string contains only digits, optionally starts with a `+`,
  /// and the length is between 10 to 15 characters.
  ///
  /// Example:
  /// ```dart
  /// "+1234567890".isPhoneNumber;  // Result: true
  /// "12345".isPhoneNumber;  // Result: false
  /// ```
  bool get isPhoneNumber {
    final regex = RegExp(r'^\+?[0-9]{10,15}$');
    return regex.hasMatch(this);
  }

  /// Checks if the string is a valid URL.
  ///
  /// Validates that the string starts with `http://` or `https://` and contains a valid URL structure.
  ///
  /// Example:
  /// ```dart
  /// "https://www.example.com".isUrl;  // Result: true
  /// "invalid-url".isUrl;  // Result: false
  /// ```
  bool get isUrl {
    final regex = RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$');
    return regex.hasMatch(this);
  }
}
