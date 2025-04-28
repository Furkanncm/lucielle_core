import 'package:flutter/material.dart';

/// ------------------------------
/// Vertical Spacing CustomBox
/// ------------------------------

/// A vertical empty box with no space (height 0).
@immutable
final class VerticalBox extends SizedBox {
  const VerticalBox({super.key}) : super.shrink();

  /// A very small vertical space (2 pixels).
  const VerticalBox.tiny({super.key}) : super(height: 2);

  /// A small vertical space (4 pixels).
  const VerticalBox.small({super.key}) : super(height: 4);

  /// A medium vertical space (8 pixels).
  const VerticalBox.medium({super.key}) : super(height: 8);

  /// A regular vertical space (12 pixels).
  const VerticalBox.regular({super.key}) : super(height: 12);

  /// A large vertical space (16 pixels).
  const VerticalBox.large({super.key}) : super(height: 16);

  /// A very large vertical space (20 pixels).
  const VerticalBox.extraLarge({super.key}) : super(height: 20);

  /// A huge vertical space (24 pixels).
  const VerticalBox.giant({super.key}) : super(height: 24);

  /// An extra huge vertical space (32 pixels).
  const VerticalBox.extraGiant({super.key}) : super(height: 32);

  /// An extremely large vertical space (48 pixels).
  const VerticalBox.huge({super.key}) : super(height: 48);

  /// An enormous vertical space (64 pixels).
  const VerticalBox.enormous({super.key}) : super(height: 64);
}

/// ------------------------------
/// Horizontal Spacing CustomBox
/// ------------------------------

/// A horizontal empty box with no space (width 0).
class HorizontalBox extends SizedBox {
  const HorizontalBox({super.key}) : super.shrink();

  /// A very small horizontal space (2 pixels).
  const HorizontalBox.tiny({super.key}) : super(width: 2);

  /// A small horizontal space (4 pixels).
  const HorizontalBox.small({super.key}) : super(width: 4);

  /// A medium horizontal space (8 pixels).
  const HorizontalBox.medium({super.key}) : super(width: 8);

  /// A regular horizontal space (12 pixels).
  const HorizontalBox.regular({super.key}) : super(width: 12);

  /// A large horizontal space (16 pixels).
  const HorizontalBox.large({super.key}) : super(width: 16);

  /// A very large horizontal space (20 pixels).
  const HorizontalBox.extraLarge({super.key}) : super(width: 20);

  /// A huge horizontal space (24 pixels).
  const HorizontalBox.giant({super.key}) : super(width: 24);

  /// An extra huge horizontal space (32 pixels).
  const HorizontalBox.extraGiant({super.key}) : super(width: 32);

  /// An extremely large horizontal space (48 pixels).
  const HorizontalBox.huge({super.key}) : super(width: 48);

  /// An enormous horizontal space (64 pixels).
  const HorizontalBox.enormous({super.key}) : super(width: 64);
}
