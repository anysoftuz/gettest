import 'package:flutter/material.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/themes/theme_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        colorSchemeSeed: green,
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          shadowColor: white,
          surfaceTintColor: white,
          centerTitle: true,
          elevation: 1,
        ),
        dividerTheme: const DividerThemeData(color: Color(0xFFEAEEF2)),
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.light],
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
        // Set the default text color to black for the light theme
        textTheme: ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(color: Colors.black),
              displayMedium: const TextStyle(color: Colors.black),
              displaySmall: const TextStyle(color: Colors.black),
              headlineLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              headlineSmall: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),
              titleSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              bodyMedium: const TextStyle(color: Colors.black),
              bodySmall: const TextStyle(color: Colors.black),
              labelLarge: const TextStyle(color: Colors.black),
              labelMedium: const TextStyle(color: Colors.black),
              labelSmall: const TextStyle(color: Colors.black),
            ),
      );

  static ThemeData darkTheme() => ThemeData.dark().copyWith(
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.dark],
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: white,
  );
  static const headlineMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: greyText,
  );
  static const titleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );
}
