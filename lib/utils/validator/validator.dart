import 'package:lucielle/lucielle.dart';
import 'package:lucielle/utils/constants/string_constants.dart';

/// A utility class containing static methods for common form validations.
///
/// This class centralizes all input validations such as email and password,
/// allowing consistent and reusable logic throughout the application.
final class Validators {
  /// Validates whether the given [value] is a properly formatted email address.
  ///
  /// Returns a localized error message string if:
  /// - [value] is null or empty
  /// - [value] is not a valid email format
  ///
  /// Returns `null` if the input is valid.
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.emailValueCantBeNull.value;
    }
    if (!(value.isEmail)) {
      return StringConstants.invalidEmail.value;
    }
    return null;
  }

  /// Validates whether the given [value] meets the required password rules.
  ///
  /// - [minSize]: Minimum number of characters required (default is 6).
  /// - [isRequiredAtLeast1Uppercase]: Whether at least one uppercase character is required.
  /// - [isRequiredAtLeast1Lowercase]: Whether at least one lowercase character is required.
  ///
  /// Returns a localized error message string if:
  /// - [value] is null or empty
  /// - [value] does not match the password policy
  ///
  /// Returns `null` if the password is valid.
static String? passwordValidator(
  String? value, {
  int minSize = 6,
  bool isRequiredAtLeast1Uppercase = true,
  bool isRequiredAtLeast1Lowercase = true,
  String? compareWith, 
}) {
  if (value == null || value.isEmpty) {
    return StringConstants.passwordCantBeNull.value;
  }

  if (!(value.isPassword(
    minSize: minSize,
    isRequiredAtLeast1Lowercase: isRequiredAtLeast1Lowercase,
    isRequiredAtLeast1Uppercase: isRequiredAtLeast1Uppercase,
  ))) {
    return StringConstants.invalidPassword.value;
  }

  if (compareWith != null && value != compareWith) {
    return StringConstants.passwordsDoNotMatch.value;
  }

  return null;
}


  static String? phoneNumberValidator(String? value) {
    if (value == null || !value.isPhoneNumber) return StringConstants.invalidPhoneNumber.value;
    return null;
  }
}
