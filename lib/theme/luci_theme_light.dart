import 'package:flutter/material.dart';
import 'package:lucielle/theme/luci_theme.dart';

/// Represents the Light Mode Theme for the application.
/// Defines all visual aspects of the app in light mode.
class LuciThemeLight extends LuciTheme {
  /// Optional [ColorScheme] to customize the theme colors.
  /// If not provided, defaults to [ColorScheme.light()].
  final ColorScheme? colorScheme;
  final ThemeData? themeData;
  final AppBarTheme? appBarTheme;
  final TextTheme? textTheme;
  final ElevatedButtonThemeData? elevatedButtonThemeData;
  final InputDecorationTheme? inputDecorationTheme;
  final CardThemeData? cardTheme;
  final IconThemeData? iconThemeData;
  final FloatingActionButtonThemeData? floatingActionButtonThemeData;
  final BottomNavigationBarThemeData? bottomNavigationBarThemeData;
  final Color? scaffoldBackgroundColor;
  final Color? dividerColor;
  final Color? disabledColor;
  final Color? highlightColor;
  final Color? splashColor;

  /// Creates a [LuciThemeLight] instance.
  ///
  /// The [colorScheme] parameter can be optionally passed to override default light colors.
  LuciThemeLight(
    this.themeData,
    this.appBarTheme,
    this.textTheme,
    this.elevatedButtonThemeData,
    this.inputDecorationTheme,
    this.cardTheme,
    this.iconThemeData,
    this.floatingActionButtonThemeData,
    this.bottomNavigationBarThemeData,
    this.scaffoldBackgroundColor,
    this.disabledColor,
    this.dividerColor,
    this.highlightColor,
    this.splashColor, {
    this.colorScheme,
  });

  /// Returns the effective [ColorScheme].
  /// If [colorScheme] is not set, returns [ColorScheme.light()].
  ColorScheme get _colorScheme => colorScheme ?? const ColorScheme.light();

  /// Builds the complete [ThemeData] for the light mode.
  ///
  /// Customizes the following:
  /// - [ColorScheme]
  /// - [ScaffoldBackgroundColor]
  /// - [AppBarTheme]
  /// - [TextTheme]
  /// - [ElevatedButtonThemeData]
  /// - [InputDecorationTheme]
  /// - [CardTheme]
  /// - [IconThemeData]
  /// - [FloatingActionButtonThemeData]
  /// - [BottomNavigationBarThemeData]
  /// - [DividerColor]
  /// - [DisabledColor]
  /// - [HighlightColor]
  /// - [SplashColor]
  @override
  ThemeData get luciThemeData => ThemeData.light().copyWith(
    /// Base color palette.
    /// [colorScheme] defines the overall color properties for Light Theme.
    colorScheme: _colorScheme,

    /// Scaffold background color.
    /// Sets the background color for screens to [colorScheme.background].
    scaffoldBackgroundColor: scaffoldBackgroundColor ?? _colorScheme.surface,

    /// AppBar styling.
    /// [backgroundColor: colorScheme.surface, foregroundColor: colorScheme.onSurface] for AppBar.
    appBarTheme:
        appBarTheme ??
        AppBarTheme(
          backgroundColor: _colorScheme.surface,
          foregroundColor: _colorScheme.onSurface,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: _colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

    /// Global text styles.
    /// Text colors based on [colorScheme.onBackground].
    textTheme:
        textTheme ??
        TextTheme(
          displayLarge: TextStyle(color: _colorScheme.onSurface),
          displayMedium: TextStyle(color: _colorScheme.onSurface),
          displaySmall: TextStyle(color: _colorScheme.onSurface),
          headlineLarge: TextStyle(color: _colorScheme.onSurface),
          headlineMedium: TextStyle(color: _colorScheme.onSurface),
          headlineSmall: TextStyle(color: _colorScheme.onSurface),
          titleLarge: TextStyle(color: _colorScheme.onSurface),
          titleMedium: TextStyle(color: _colorScheme.onSurface),
          titleSmall: TextStyle(color: _colorScheme.onSurface),
          bodyLarge: TextStyle(color: _colorScheme.onSurface),
          bodyMedium: TextStyle(color: _colorScheme.onSurface),
          bodySmall: TextStyle(color: _colorScheme.onSurface),
          labelLarge: TextStyle(color: _colorScheme.primary),
          labelMedium: TextStyle(color: _colorScheme.primary),
          labelSmall: TextStyle(color: _colorScheme.primary),
        ),

    /// ElevatedButton styling.
    /// [Background: colorScheme.primary, ForegroundColor: colorScheme.onPrimary] styling.
    elevatedButtonTheme:
        elevatedButtonThemeData ??
        ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _colorScheme.primary,
            foregroundColor: _colorScheme.onPrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

    /// Input fields and form elements decoration.
    /// [FilledColor: colorScheme.surface, BorderColor: colorScheme.primary] for Input fields.
    inputDecorationTheme:
        inputDecorationTheme ??
        InputDecorationTheme(
          filled: true,
          fillColor: _colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colorScheme.secondary),
          ),
          labelStyle: TextStyle(color: _colorScheme.onSurface),
        ),

    /// Card styling across the app.
    /// [Color: colorScheme.surface] for card background.
    cardTheme:
        cardTheme ??
        CardThemeData(
          color: _colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          margin: const EdgeInsets.all(8),
        ),

    /// Icon styling.
    /// [Color: colorScheme.primary] for icons.
    iconTheme: iconThemeData ?? IconThemeData(color: _colorScheme.primary),

    /// Floating action button (FAB) styling.
    /// [BackgroundColor: colorScheme.secondary, ForegroundColor: colorScheme.onSecondary] for FAB.
    floatingActionButtonTheme:
        floatingActionButtonThemeData ??
        FloatingActionButtonThemeData(
          backgroundColor: _colorScheme.secondary,
          foregroundColor: _colorScheme.onSecondary,
        ),

    /// Bottom navigation bar styling.
    /// [BackgroundColor: colorScheme.surface, SelectedItemColor: colorScheme.primary] for BottomNavBar.
    bottomNavigationBarTheme:
        bottomNavigationBarThemeData ??
        BottomNavigationBarThemeData(
          backgroundColor: _colorScheme.surface,
          selectedItemColor: _colorScheme.primary,
          unselectedItemColor: _colorScheme.onSurface.withOpacity(0.5),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),

    /// Divider color.
    /// [Color: colorScheme.onBackground.withOpacity(0.2)] for Dividers.
    dividerColor: dividerColor ?? _colorScheme.onSurface.withOpacity(0.2),

    /// Disabled widget color.
    /// [Color: colorScheme.onBackground.withOpacity(0.4)] for Disabled widgets.
    disabledColor: disabledColor ?? _colorScheme.onSurface.withOpacity(0.4),

    /// Highlight color for tap effects.
    /// [Color: colorScheme.primary.withOpacity(0.1)] for tap highlight effects.
    highlightColor: highlightColor ?? _colorScheme.primary.withOpacity(0.1),

    /// Splash color for ripple effects.
    /// [Color: colorScheme.primary.withOpacity(0.2)] for splash ripple effect.
    splashColor: splashColor ?? _colorScheme.primary.withOpacity(0.2),
  );
}
