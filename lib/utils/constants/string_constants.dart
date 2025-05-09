/// An enum that defines commonly used string constants
/// across the application, primarily for form validation
/// and UI labels.
///
/// Using an enum instead of plain strings ensures type safety
/// and helps centralize localization or string management.
enum StringConstants {
  /// Error message shown when the email field is left empty.
  emailValueCantBeNull("Email value is can not be null"),

  /// Error message shown when the password field is left empty.
  passwordCantBeNull("Password is can not be null"),

  /// Error message shown when the entered email is not valid.
  invalidEmail("Email is not valid"),

  /// Error message shown when the entered password doesn't meet the criteria.
  invalidPassword("Password is no valid"),

  /// The label used for email input fields.
  email("Email"),

  /// The label used for password input fields.
  password("Password");

  /// The actual string value associated with the constant.
  final String value;

  /// Constructs a [StringConstants] with the given [value].
  const StringConstants(this.value);
}
