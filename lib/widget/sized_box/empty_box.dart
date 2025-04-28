import 'package:flutter/material.dart';

/// A reusable widget that renders an empty, zero-sized box.
///
/// `EmptyBox` is a convenient way to return an empty widget
/// without occupying any space on the screen.
///
/// Equivalent to `SizedBox.shrink()` but wrapped in a widget
/// for better readability and potential future extensions.
///
/// Example usage:
/// ```dart
/// condition ? MyWidget() : EmptyBox()
/// ```
@immutable
final class EmptyBox extends StatelessWidget {
  const EmptyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
