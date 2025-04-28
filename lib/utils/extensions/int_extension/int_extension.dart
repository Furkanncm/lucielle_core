/// Extension for adding utility methods to the `int` type for duration conversion.
extension IntExtension on int {
  /// Converts the integer to a `Duration` representing microseconds.
  ///
  /// This is useful when you need to work with durations in microseconds.
  ///
  /// Example:
  /// ```dart
  /// 5.microseconds;  // Result: Duration(microseconds: 5)
  /// ```
  Duration get microseconds => Duration(microseconds: this);

  /// Converts the integer to a `Duration` representing milliseconds.
  ///
  /// This is useful when you need to work with durations in milliseconds.
  ///
  /// Example:
  /// ```dart
  /// 500.microseconds;  // Result: Duration(milliseconds: 500)
  /// ```
  Duration get milliseconds => Duration(milliseconds: this);

  /// Converts the integer to a `Duration` representing seconds.
  ///
  /// This is useful when you need to work with durations in seconds.
  ///
  /// Example:
  /// ```dart
  /// 10.seconds;  // Result: Duration(seconds: 10)
  /// ```
  Duration get seconds => Duration(seconds: this);

  /// Converts the integer to a `Duration` representing minutes.
  ///
  /// This is useful when you need to work with durations in minutes.
  ///
  /// Example:
  /// ```dart
  /// 5.minutes;  // Result: Duration(minutes: 5)
  /// ```
  Duration get minutes => Duration(minutes: this);

  /// Converts the integer to a `Duration` representing hours.
  ///
  /// This is useful when you need to work with durations in hours.
  ///
  /// Example:
  /// ```dart
  /// 2.hours;  // Result: Duration(hours: 2)
  /// ```
  Duration get hours => Duration(hours: this);

  /// Converts the integer to a `Duration` representing days.
  ///
  /// This is useful when you need to work with durations in days.
  ///
  /// Example:
  /// ```dart
  /// 3.days;  // Result: Duration(days: 3)
  /// ```
  Duration get days => Duration(days: this);
}
